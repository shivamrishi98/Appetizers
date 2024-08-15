//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Shivam Rishi on 15/8/2024.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date { Calendar.current.date(byAdding: .year, value: -18, to: Date())! }
    
    var oneHundredTenYearsAgo: Date { Calendar.current.date(byAdding: .year, value: -110, to: Date())! }

}
