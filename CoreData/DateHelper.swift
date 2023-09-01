//
//  DateHelper.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 29.08.2023.
//

import Foundation

final class DateHelper {
    static func getDate(date: Date?) -> String {
        guard let date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        return dateFormatter.string(from: date)
    }
}
