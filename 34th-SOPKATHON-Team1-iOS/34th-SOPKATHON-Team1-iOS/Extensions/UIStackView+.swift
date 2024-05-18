//
//  UIStackView+.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/17/24.
//

import UIKit

extension UIStackView {
   func addArrangedSubviews(_ views: UIView...) {
      for view in views {
         self.addArrangedSubview(view)
      }
   }
}
