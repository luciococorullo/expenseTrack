//
//  PreviewData.swift
//  expenseTrack
//
//  Created by Lucio Cocorullo on 20/12/22.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date:"01/02/2022",instituition: "Desjardins",account: "Visa Desjardins", merchant: "Apple", amount: 799.99, type: "debit", categoryId: 801, category: "Software", isPending: false, isTrasfer: false,isExpense: true,isEdited: false)

var transactionPreviewData2 = Transaction(id: 2, date:"01/02/2022",instituition: "Desjardins",account: "Visa Desjardins", merchant: "Paycheck", amount: 2000.00, type: "credit", categoryId: 701, category: "Paycheck", isPending: false, isTrasfer: false,isExpense: false,isEdited: false)

//var transactionListPreviewData = [Transaction](repeating:transactionPreviewData, count: 3)

var transactionListPreviewData = [transactionPreviewData2,transactionPreviewData,transactionPreviewData]
