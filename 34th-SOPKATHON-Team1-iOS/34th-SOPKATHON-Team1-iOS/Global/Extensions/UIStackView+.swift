//
//  UIStackView+.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/18/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
}
