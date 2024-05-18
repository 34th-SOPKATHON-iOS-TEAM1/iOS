//
//  UILabel+.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/18/24.
//

import UIKit

extension UILabel {
    
    static func attributedText(for fontName: FontName, withText text: String)  {
        let spacing: CGFloat
        
        switch fontName {
        case .heading1, .heading2:
            spacing = 1
        case .title1, .title2:
            spacing = 1.45 * fontName.size
        case .body1, .detail1:
            spacing = 1.4 * fontName.size
        }
        
        let font = UIFont.pretendard(fontName)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        
        let attributedStr = NSMutableAttributedString(string: text, attributes:  attributes)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributedStr.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSRange(location: 0, length: attributedStr.length)
        )
    }
}

