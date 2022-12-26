//
//  Extensions.swift
//  expenseTrack
//
//  Created by Lucio Cocorullo on 20/12/22.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericEU: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericEU.date(from: self) else { return Date()}
        
        return parsedDate
    }
}

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.day().month().year())
    }
}

extension Double {
    func rounded2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
