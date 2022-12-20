//
//  PreviewData.swift
//  expenseTrack
//
//  Created by Lucio Cocorullo on 20/12/22.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date:"01/02/2022",instituition: "Desjardins",account: "Visa Desjardins", merchant: "Apple", amount: 799.99, type: "debit", categoryId: 801, category: "Software", isPending: false, isTrasfer: false,isExpense: true,isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
