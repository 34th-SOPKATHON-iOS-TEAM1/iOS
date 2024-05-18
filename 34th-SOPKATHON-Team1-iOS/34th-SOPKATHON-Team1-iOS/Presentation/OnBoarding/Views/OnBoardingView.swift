//
//  OnBoardingView.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

final class OnBoardingView: UIView {
    
    // MARK: - UI Properties
    
    private let graphicImageView: UIImageView = UIImageView()
    
    private let noticeLabel: UILabel = UILabel()
    
    private let inputTextField: UITextField = UITextField()
    
    private let startButton: UIButton = UIButton()
    
    
    // MARK: - Properties
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Private Methods

private extension OnBoardingView {
    
    func setHierarchy() {
        self.addSubviews(graphicImageView, noticeLabel, inputTextField, startButton)
    }
    
    func setLayout() {
        graphicImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo((screenWidth - 32) * (385 / 343))
            $0.top.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(graphicImageView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview()
        }
        
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(64)
        }
        
    }

    func setStyle() {
        self.backgroundColor = UIColor(resource: .white000)
        
        graphicImageView.do {
           $0.image = UIImage(resource: .onboarding)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
        
        noticeLabel.do {
            $0.numberOfLines = 0
//            $0.attributedText = UILabel.attributedText(for: .title1, withText: "나의 삶의 균형을 위한\n최종 목표를 설정해주세요.")
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
//            $0.setAttributedTitle(UILabel.attributedText(for: .heading2, withText: "서비스 시작하기"), for: .normal)
            $0.setTitleColor(UIColor(resource: .white000), for: .normal)
        }
    }
    
}
