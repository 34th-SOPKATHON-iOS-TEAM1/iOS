//
//  UIFont+.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/18/24.
//

import UIKit

enum FontName {
    case heading1
    case heading2, heading3, title1, title2
    case body1
    case detail1
    
    var rawValue: String {
            switch self {
            case .heading1, .heading2:
                return "Montserrat-Bold"
            case .heading3, .title1, .title2:
                return "Pretendard-SemiBold"
            case .detail1:
                return "Pretendard-Medium"
            case .body1:
                return "Pretendard-Regular"
            }
        }
        
        var size: CGFloat {
            switch self {
            case .heading1:
                return 28
            case .heading2:
                return 24
            case .heading3:
                return 20
            case .title1:
                return 18
            case .title2:
                return 14
            case .body1:
                return 12
            case .detail1:
                return 10
            }
        }
}

extension UIFont {
    
    static func pretendard(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
}
