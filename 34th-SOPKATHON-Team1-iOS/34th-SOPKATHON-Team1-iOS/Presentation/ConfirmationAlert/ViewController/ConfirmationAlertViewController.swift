//
//  ConfirmationAlertViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import UIKit
import SnapKit
import Then

class ConfirmationAlertViewController: UIViewController {
   
   // MARK: - UI Components
   
   let container = UIView()
   
   let congratulationsLabel = UILabel()
   
   let cancelBtn = UIButton()
   
   let goToSeeS0wBtn = UIButton()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      setHierachy()
      setStyle()
      setLayout()
   }
   
   func setHierachy() {
      container.addSubviews(cancelBtn, congratulationsLabel, goToSeeS0wBtn)
      if let sheetPresentationController = sheetPresentationController {
         sheetPresentationController.preferredCornerRadius = 15
         sheetPresentationController.prefersGrabberVisible = false
         sheetPresentationController.detents = [.custom {context in
            return UIScreen.main.bounds.height * 0.62}]
      }
      view.addSubview(container)
   }
   
   func setStyle() {
      container.do {
         $0.layer.cornerRadius = 12
         $0.layer.borderColor = UIColor.red.cgColor
         $0.backgroundColor = .white
      }
      
      congratulationsLabel.do {
         $0.text = "축하해!\n시소가 완벽한 균형을 잡았어!"
         $0.numberOfLines = 2
         $0.font = .pretendard(.title1)
         $0.textAlignment = .center
      }
      
      cancelBtn.do {
         $0.setImage(UIImage(resource: .cancel), for: .normal)
         $0.addTarget(self, action: #selector(didTapCancelBtn), for: .touchUpInside)
      }
      
      goToSeeS0wBtn.do {
         $0.backgroundColor = .black000
         $0.layer.cornerRadius = 30
         $0.setTitle("내 시소 보러가기", for: .normal)
         $0.titleLabel?.font = .pretendard(.heading2)
         $0.titleLabel?.textColor = .white000
         $0.titleLabel?.textAlignment = .center
         $0.addTarget(self, action: #selector(didTapgoToSeeS0wBtn), for: .touchUpInside)
      }
   }
   
   func setLayout() {
      congratulationsLabel.snp.makeConstraints {
         $0.top.equalToSuperview().offset(64)
         $0.leading.trailing.equalToSuperview().inset(16)
      }
      
      cancelBtn.snp.makeConstraints {
         $0.width.height.equalTo(24)
         $0.top.trailing.equalToSuperview().inset(16)
      }
      
      container.snp.makeConstraints {
         $0.top.equalToSuperview()
         $0.leading.trailing.equalToSuperview().inset(16)
         $0.bottom.equalToSuperview().inset(287)
      }
      
      goToSeeS0wBtn.snp.makeConstraints {
         $0.bottom.equalToSuperview().inset(32)
         $0.centerX.equalToSuperview()
         $0.height.equalTo(64)
         $0.width.equalTo(277)
      }
   }
   
   @objc func didTapCancelBtn() {
      self.dismiss(animated: true)
   }
   
   @objc func didTapgoToSeeS0wBtn() {
      print("~didTapgoToSeeS0wBtn~")
   }
   
}
