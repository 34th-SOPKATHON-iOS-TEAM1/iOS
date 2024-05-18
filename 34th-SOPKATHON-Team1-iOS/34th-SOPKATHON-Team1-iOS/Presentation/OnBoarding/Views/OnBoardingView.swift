//
//  OnBoardingView.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

protocol OnBoardingViewDelegate: AnyObject {
    func pushToRegisterToDoVC()
}

final class OnBoardingView: UIView {
    
    // MARK: - UI Properties
    
    private let graphicImageView: UIImageView = UIImageView()
    
    private let noticeLabel: UILabel = UILabel()
    
    let inputTextField: UITextField = UITextField()
    
    private let startButton: UIButton = UIButton()
    
    private let buttonBox = UIView()

    private let clearButton = UIButton()
    
    
    // MARK: - Properties
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var isActivate: Bool = false
    
    weak var delegate: OnBoardingViewDelegate?
    

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
    
    @objc
    func clearButtonTapped(_ sender: UIButton) {
        self.inputTextField.text = ""
        
        setStartButton(isEnabled: false)
    }
    
    @objc
    func textFieldChange() {
        let text = self.inputTextField.text ?? ""
        
        if !text.isEmpty {
            clearButton.isHidden = false
        }
        
        setStartButton(isEnabled: !text.isEmpty)
    }
    
    @objc
    func pushToRegisterToDoVC() {
        if isActivate {
//            let id = self.inputTextField.text ?? ""
            self.delegate?.pushToRegisterToDoVC()
        }
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
            $0.text = "나의 삶의 균형을 위한\n최종 목표를 설정해주세요."
            $0.textColor = UIColor(resource: .black000)
        }
        
        inputTextField.do {
            $0.setPlaceholder(placeholder: "최종 목표를 입력해주세요.", font: UIFont.pretendard(.title1), fontColor: UIColor(resource: .gray700))
            $0.setTextFont(font: UIFont.pretendard(.title1), fontColor: UIColor(resource: .black000))
            $0.addPadding(left: 24)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = UIColor(resource: .gray100)
            
            buttonBox.addSubview(clearButton)
            buttonBox.snp.makeConstraints {
                $0.width.equalTo(48)
                $0.height.equalTo(24)
            }
            clearButton.snp.makeConstraints {
                $0.top.leading.equalToSuperview()
                $0.size.equalTo(24)
            }
            $0.rightView = buttonBox
            $0.rightViewMode = .whileEditing
            
            $0.delegate = self
            $0.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
            
        }
        
        startButton.do {
            $0.layer.cornerRadius = 30
            $0.backgroundColor = UIColor(resource: .gray600)
//            $0.setAttributedTitle(UILabel.attributedText(for: .heading2, withText: "서비스 시작하기"), for: .normal)
            $0.setTitle("서비스 시작하기", for: .normal)
            $0.setTitleColor(UIColor(resource: .white000), for: .normal)
            $0.addTarget(self, action: #selector(pushToRegisterToDoVC), for: .touchUpInside)
        }
        
        buttonBox.do {
            $0.backgroundColor = UIColor.clear
        }
        
        clearButton.do {
            $0.setImage(UIImage(resource: .cancel), for: .normal)
            $0.tag = 0
            $0.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        }
    }
    
    func setStartButton(isEnabled: Bool) {
        startButton.layer.borderWidth = 0

        if isEnabled {
            startButton.backgroundColor = UIColor(resource: .mint400)
            startButton.setTitleColor(UIColor(resource: .white000), for: .normal)
            startButton.isEnabled = true
            isActivate = true
        } else {
            startButton.backgroundColor = UIColor(resource: .gray600)
            startButton.setTitleColor(UIColor(resource: .white000), for: .normal)
            startButton.isEnabled = false
            isActivate = false
        }
    }
    
    
}

// MARK: - Delegates

extension OnBoardingView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing (_ textField: UITextField) {
        
        let text = textField.text ?? ""
        
        self.inputTextField.layer.borderColor = UIColor(resource: .mint400).cgColor
        self.inputTextField.layer.borderWidth = 2
        self.inputTextField.backgroundColor = UIColor(resource: .mint100)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let text = textField.text ?? ""
        
        self.inputTextField.layer.borderWidth = 0

        if text.isEmpty {
            self.inputTextField.backgroundColor = UIColor(resource: .gray100)
        } else {
            self.inputTextField.backgroundColor = UIColor(resource: .mint100)
        }
        print("text \(text)")

    }
}
