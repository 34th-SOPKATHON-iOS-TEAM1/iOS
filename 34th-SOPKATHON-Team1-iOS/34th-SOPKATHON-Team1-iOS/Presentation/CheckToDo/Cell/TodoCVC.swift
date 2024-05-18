
//
//  TodoCVC.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 이지훈 on 5/19/24.
//
import UIKit
import SnapKit
import Then

class TodoCVC: UICollectionViewCell {
    
    weak var delegate: TodoCellDelegate?
    
    private let titleLabel = UILabel()
    private let modifyLabel = UILabel()
    private let firstRowView = UIView()
    private let secondRowView = UIView()
    private let thirdRowView = UIView()
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let thirdLabel = UILabel()
    private let firstButton = UIButton()
    private let secondButton = UIButton()
    private let thirdButton = UIButton()
    
    private var isFirstButtonPressed = false
    private var isSecondButtonPressed = false
    private var isThirdButtonPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupProperty()
        setupButtonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperty() {
        titleLabel.do {
            $0.text = "To-Do"
            $0.font = UIFont(name: "Pretendard-Bold", size: 20)
            $0.textColor = .black
        }
        
        modifyLabel.do {
            $0.text = "수정하기"
            $0.font = UIFont(name: "Pretendard-Medium", size: 10)
            $0.textColor = UIColor.gray700
        }
        
        firstRowView.do {
            $0.backgroundColor = UIColor.gray400
            $0.layer.cornerRadius = 8
        }
        
        secondRowView.do {
            $0.backgroundColor = UIColor.gray400
            $0.layer.cornerRadius = 8
        }
        
        thirdRowView.do {
            $0.backgroundColor = UIColor.gray400
            $0.layer.cornerRadius = 8
        }
        
        firstLabel.do {
            $0.text = "1"
            $0.font = UIFont.pretendard(.title2)
            $0.textColor = .gray800

        }
        
        secondLabel.do {
            $0.text = "2"
            $0.font = UIFont.pretendard(.title2)
            $0.textColor = .gray800

        }
        
        thirdLabel.do {
            $0.text = "3"
            $0.font = UIFont.pretendard(.title2)
            $0.textColor = .gray800

        }
        
        setupButton(firstButton)
        setupButton(secondButton)
        setupButton(thirdButton)
    }
    
    private func setupButton(_ button: UIButton) {
            button.do {
                $0.setImage(UIImage(named: "todoCheckBtn"), for: .normal)
                $0.backgroundColor = .clear
                $0.layer.cornerRadius = 5
            }
        }

    
    private func setupButtonActions() {
        firstButton.addTarget(self, action: #selector(firstButtonTapped), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)
    }
    
    @objc private func firstButtonTapped() {
        isFirstButtonPressed.toggle()
        firstRowView.backgroundColor = isFirstButtonPressed ? .mint400 : UIColor.gray400
        firstButton.setImage(UIImage(named: isFirstButtonPressed ? "TodoDoneCheck" : "todoCheckBtn"), for: .normal)
        delegate?.buttonStateChanged(buttonIdentifier: "Todo1", isPressed: isFirstButtonPressed)
    }

    @objc private func secondButtonTapped() {
        isSecondButtonPressed.toggle()
        secondRowView.backgroundColor = isSecondButtonPressed ? .mint400 : UIColor.gray400
        secondButton.setImage(UIImage(named: isSecondButtonPressed ? "TodoDoneCheck" : "todoCheckBtn"), for: .normal)
        delegate?.buttonStateChanged(buttonIdentifier: "Todo2", isPressed: isSecondButtonPressed)
    }

    @objc private func thirdButtonTapped() {
        isThirdButtonPressed.toggle()
        thirdRowView.backgroundColor = isThirdButtonPressed ? .mint400 : UIColor.gray400
        thirdButton.setImage(UIImage(named: isThirdButtonPressed ? "TodoDoneCheck" : "todoCheckBtn"), for: .normal)
        delegate?.buttonStateChanged(buttonIdentifier: "Todo3", isPressed: isThirdButtonPressed)
    }

    
    
    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(modifyLabel)
        addSubview(firstRowView)
        addSubview(secondRowView)
        addSubview(thirdRowView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
        }
        
        modifyLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        setupRowView(firstRowView, withLabel: firstLabel, andButton: firstButton)
        setupRowView(secondRowView, withLabel: secondLabel, andButton: secondButton)
        setupRowView(thirdRowView, withLabel: thirdLabel, andButton: thirdButton)
    }
    
    private func setupRowView(_ view: UIView, withLabel label: UILabel, andButton button: UIButton) {
        addSubview(view)
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        button.snp.makeConstraints {
            $0.trailing.equalTo(view.snp.trailing).offset(-4)
            $0.centerY.equalTo(view.snp.centerY)
            $0.width.height.equalTo(40)
            $0.top.bottom.equalTo(view).inset(4)
        }

        
        view.snp.makeConstraints {
            if view == firstRowView {
                $0.top.equalTo(modifyLabel.snp.bottom).offset(12)
            } else if view == secondRowView {
                $0.top.equalTo(firstRowView.snp.bottom).offset(12)
            } else {
                $0.top.equalTo(secondRowView.snp.bottom).offset(12)
            }
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
    }
}
