//
//  OnBoardingViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

final class OnBoardingViewController: UIViewController {

    // MARK: - UI Properties
    
    private let graphicImageView: UIImageView = UIImageView()
    
    private let noticeLabel: UILabel = UILabel()
    
    private let inputTextField: UITextField = UITextField()
    
    private let startButton: UIButton = UIButton()
    
    
    // MARK: - Properties
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    private let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
}


// MARK: - Private Methods

private extension OnBoardingViewController {
    
    func setHierarchy() {
        self.view.addSubviews(graphicImageView, noticeLabel, inputTextField, startButton)
    }
    
    func setLayout() {
        graphicImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo((screenWidth - 32) * (385 / 343))
            $0.top.equalToSuperview().inset(statusBarHeight + 9)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(graphicImageView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(56)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(64)
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .white000)
        
        graphicImageView.do {
            $0.image = UIImage(resource: .dummy8)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
        
        noticeLabel.do {
            $0.numberOfLines = 0
            $0.attributedText = UILabel.attributedText(for: .title1, withText: "나의 삶의 균형을 위한\n최종 목표를 설정해주세요.")
            $0.textColor = UIColor(resource: .black000)
        }
        
        inputTextField.do {
            $0.setPlaceholder(placeholder: "어쩌구", font: UIFont.pretendard(.title1), fontColor: UIColor(resource: .gray700))
            $0.addPadding(left: 24)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = UIColor(resource: .gray200)
        }
        
        startButton.do {
            $0.layer.cornerRadius = 30
            $0.backgroundColor = UIColor(resource: .black000)
            $0.setAttributedTitle(UILabel.attributedText(for: .heading2, withText: "서비스 시작하기"), for: .normal)
            $0.setTitleColor(UIColor(resource: .white000), for: .normal)
        }
    }
    
}
