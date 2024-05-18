//
//  RegisterNotToDoView.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 조혜린 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class RegisterNotToDoView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let viewTitleLabel = UILabel()
    private let dividerView = UIView()
    private let stepLabel = UILabel()
    private let titleLabel = UILabel()
    private let discriptionLabel = UILabel()
    private let previousButton = UIButton()
    private let nextButton = UIButton()
    private let buttonStackView = UIStackView()
    private let clearButton1 = UIButton()
    private let clearButton2 = UIButton()
    private let clearButton3 = UIButton()
    private let notTodoTextField1 = UITextField()
    private let notTodoTextField2 = UITextField()
    private let notTodoTextField3 = UITextField()
    private let textFieldStackView = UIStackView()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RegisterNotToDoView {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .white000
        
        viewTitleLabel.do {
            $0.text = "목표 등록"
            $0.textColor = .black000
            $0.font = .pretendard(.title1)
        }
        
        dividerView.do {
            $0.backgroundColor = .gray400
        }
        
        stepLabel.do {
            $0.text = "2/2"
            $0.textColor = .gray600
            $0.font = .pretendard(.title1)
        }
        
        titleLabel.do {
            $0.text = "NOT TO-DO"
            $0.textColor = .black000
            $0.font = .pretendard(.heading1)
        }
        
        discriptionLabel.do {
            $0.text = "NOT TO-DO에 대한 설명이 간단하게 들어갑니다."
            $0.textColor = .gray800
            $0.font = .pretendard(.title2)
        }
        
        previousButton.do {
            $0.setTitle("이전", for: .normal)
            $0.setTitleColor(.black000, for: .normal)
            $0.titleLabel?.font = .pretendard(.heading3)
            $0.backgroundColor = .gray100
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray600.cgColor
            $0.layer.cornerRadius = 32
        }
        
        nextButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.titleLabel?.font = .pretendard(.heading3)
            $0.backgroundColor = .black000
            $0.layer.cornerRadius = 32
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
        }
        
        clearButton1.do {
            $0.setImage(UIImage(resource: .icClear), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            $0.contentMode = .scaleAspectFit
            $0.isHidden = true
        }
        
        clearButton2.do {
            $0.setImage(UIImage(resource: .icClear), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            $0.contentMode = .scaleAspectFit
            $0.isHidden = true
        }
        
        clearButton3.do {
            $0.setImage(UIImage(resource: .icClear), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            $0.contentMode = .scaleAspectFit
            $0.isHidden = true
        }
        
        notTodoTextField1.do {
            $0.setPlaceholder(placeholder: "목표를 입력하세요", font: .pretendard(.title1), fontColor: .gray700)
            $0.setTextFont(font: .pretendard(.title1), fontColor: .black000)
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 12
            
            //번호 이미지 추가해야함
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 24))
            $0.leftViewMode = .always
            $0.leftView = leftView
            
            let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 24))
            rightView.addSubview(clearButton1)
            $0.rightViewMode = .never
            $0.rightView = rightView
        }
        
        notTodoTextField2.do {
            $0.setPlaceholder(placeholder: "목표를 입력하세요", font: .pretendard(.title1), fontColor: .gray700)
            $0.setTextFont(font: .pretendard(.title1), fontColor: .black000)
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 12
            
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 24))
            $0.leftViewMode = .always
            $0.leftView = leftView
            
            let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 24))
            rightView.addSubview(clearButton2)
            $0.rightViewMode = .never
            $0.rightView = rightView
        }
        
        notTodoTextField3.do {
            $0.setPlaceholder(placeholder: "목표를 입력하세요", font: .pretendard(.title1), fontColor: .gray700)
            $0.setTextFont(font: .pretendard(.title1), fontColor: .black000)
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 12
            
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 24))
            $0.leftViewMode = .always
            $0.leftView = leftView
            
            let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 24))
            rightView.addSubview(clearButton3)
            $0.rightViewMode = .never
            $0.rightView = rightView
        }
        
        textFieldStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            viewTitleLabel,
            dividerView,
            stepLabel,
            titleLabel,
            discriptionLabel,
            buttonStackView,
            textFieldStackView
        )
        buttonStackView.addArrangedSubviews(previousButton, nextButton)
        textFieldStackView.addArrangedSubviews(
            notTodoTextField1,
            notTodoTextField2,
            notTodoTextField3
        )
    }
    
    private func setupLayout() {
        viewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).inset(16.5)
        }
        
        dividerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(viewTitleLabel.snp.bottom).offset(15.5)
        }
        
        stepLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(dividerView.snp.bottom).offset(32)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(stepLabel.snp.bottom).offset(14)
        }
        
        discriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        for button in buttonStackView.arrangedSubviews {
            button.snp.makeConstraints{
                $0.height.equalTo(64)
                $0.width.equalTo(168)
            }
        }
        
        buttonStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(56)
        }
        
        for textfield in textFieldStackView.arrangedSubviews {
            textfield.snp.makeConstraints{
                $0.height.equalTo(64)
            }
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(discriptionLabel.snp.bottom).offset(22)
        }
    }
    
    //MARK: - Method
    
    func setupTextFieldDelegate(_ viewController: UITextFieldDelegate) {
        notTodoTextField1.delegate = viewController
        notTodoTextField2.delegate = viewController
        notTodoTextField3.delegate = viewController
    }
}
