//
//  expenseTrackApp.swift
//  expenseTrack
//
//  Created by Lucio Cocorullo on 20/12/22.
//

import SwiftUI

@main
struct expenseTrackApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
