//
//  TransactionModel.swift
//  expenseTrack
//
//  Created by Lucio Cocorullo on 20/12/22.
//

import Foundation

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let instituition: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    let isTrasfer: Bool
    let isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmout: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
