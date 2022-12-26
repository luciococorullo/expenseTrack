//
//  TransactionListViewModel.swift
//  expenseTrack
//
//  Created by Lucio Cocorullo on 20/12/22.
//

import Combine
import Foundation
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions () {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print ("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {return [:]}
        
        let groupedTransactions =  TransactionGroup(grouping: transactions) { $0.month}
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        guard !transactions.isEmpty else {return []}
        
        let today = "17/02/2022".dateParsed() //Date() for production
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval!.start, to: today, by: 60 * 60 * 24) {
            let dailyExpeses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpeses.reduce(0) { $0 - $1.signedAmout}
            
            sum += dailyTotal
            sum = sum.rounded2Digits()
            cumulativeSum.append((date.formatted(), sum))
            
            
        }
        
        return cumulativeSum
        
    }
    
}
