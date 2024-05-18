//
//  SuccessViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import UIKit
import SnapKit
import Then

class SuccessViewController: UIViewController {
   
   // MARK: - UI Components
   
   private let container = UIView()
   
   private let sees0ImageView = UIImageView()
   
   private let titleLabel = UILabel()
   
   private let cancelBtn = UIButton()
   
   private let subTitleLabel = UILabel()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      setHierachy()
      setStyle()
      setLayout()
   }
   
   // MARK: setHierachy
   
   private func setHierachy() {
      container.addSubviews(
         cancelBtn,
         sees0ImageView,
         titleLabel,
         subTitleLabel
      )
      
      if let sheetPresentationController = sheetPresentationController {
         sheetPresentationController.preferredCornerRadius = 15
         sheetPresentationController.prefersGrabberVisible = false
         sheetPresentationController.detents = [.custom {context in
            return UIScreen.main.bounds.height * 0.68}]
      }
      
      view.addSubview(container)
   }
   
   // MARK: setStyle
   
   private func setStyle() {
      container.do {
         $0.layer.cornerRadius = 12
         $0.layer.borderColor = UIColor.red.cgColor
         $0.backgroundColor = .white
      }
      
      sees0ImageView.do {
         $0.image = UIImage(resource: .successModal)
         $0.layer.borderWidth = 0
      }
      
      titleLabel.do {
         $0.text = "시소가 완벽한 균형을 잡았어!"
         $0.font = .pretendard(.heading3)
         $0.textAlignment = .center
         $0.textColor = .black000
      }
      
      cancelBtn.do {
         $0.setImage(UIImage(resource: .cancel), for: .normal)
         $0.addTarget(self, action: #selector(didTapCancelBtn), for: .touchUpInside)
      }
      
      subTitleLabel.do {
         $0.text = "내일도 균형 잡힌 하루를 위해 두잉낫두잉을 찾아줘!"
         $0.font = .pretendard(.title2)
         $0.textAlignment = .center
         $0.textColor = .gray700
      }
   }
   
   // MARK: setLayout
   
   private func setLayout() {
      container.snp.makeConstraints {
         $0.top.equalToSuperview()
         $0.leading.trailing.equalToSuperview().inset(16)
         $0.height.equalTo(307)
      }
      
      cancelBtn.snp.makeConstraints {
         $0.width.height.equalTo(24)
         $0.top.trailing.equalToSuperview().inset(16)
      }
      
      sees0ImageView.snp.makeConstraints {
         $0.leading.trailing.equalToSuperview().inset(16)
         $0.top.equalToSuperview().offset(50)
         $0.height.equalTo(153)
      }
      
      titleLabel.snp.makeConstraints {
         $0.top.equalTo(sees0ImageView.snp.bottom).offset(24)
         $0.leading.trailing.equalToSuperview().inset(16)
      }
      
      subTitleLabel.snp.makeConstraints {
         $0.leading.trailing.equalTo(titleLabel)
         $0.bottom.equalToSuperview().inset(32)
      }
   }
   
   // MARK: @objc func
   
   @objc func didTapCancelBtn() {
      self.dismiss(animated: true)
   }
   
}

