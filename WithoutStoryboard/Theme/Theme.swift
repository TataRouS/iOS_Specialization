//
//  Theme.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 30.08.2023.
//

import UIKit

enum AllAppTheme: String {
    case orange
    case yellow
    case gray
}

protocol AppTheme {
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
    var subtitleTextColor: UIColor {get}
    var type: AllAppTheme {get}
}
extension AppTheme {
    var subtitleTextColor: UIColor {
        .green
    }
}

final class Theme {
    static var currentTheme: AppTheme = OrangeTheme()
}

final class OrangeTheme: AppTheme {
    var backgroundColor: UIColor = .orange
    var textColor: UIColor = .green
    var type: AllAppTheme = .orange
}

final class YellowTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 255, alpha: 1)
    var textColor: UIColor = .blue
    var type: AllAppTheme = .yellow
}

final class GrayTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 255, alpha: 1)
    var textColor: UIColor = .blue
    var subtitleTextColor: UIColor = .magenta
    var type: AllAppTheme = .yellow
}
