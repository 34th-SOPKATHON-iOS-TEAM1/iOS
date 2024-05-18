//
//  UITextField+.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 조혜린 on 5/18/24.
//

import UIKit

extension UITextField {
    //placeholder와 placeholder의 font/fontColor를 설정하는 메소드
    func setPlaceholder(placeholder: String, font: UIFont, fontColor: UIColor?) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: fontColor ?? UIColor(), .font: font]
        )
    }
    
    //입력한 text의 font/fontColor를 설정하는 메소드
    func setTextFont(font: UIFont, fontColor: UIColor) {
        self.font = font
        self.textColor = fontColor
    }
    
    //textField의 좌,우 padding 값을 추가하는 메소드
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}
