//
//  UIView+.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/17/24.
//

import UIKit

extension UIView {
   func addSubviews(_ views: UIView...) {
      views.forEach { self.addSubview($0) }
   }
}
