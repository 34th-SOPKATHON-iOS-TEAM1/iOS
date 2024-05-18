//
//  TodoCVC.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 이지훈 on 5/19/24.
//

import UIKit
import SnapKit
import Then

class NotTodoCVC: UICollectionViewCell {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupProperty()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperty() {
        titleLabel.do {
            $0.text = "Not To-Do"
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
        }
        
        secondLabel.do {
            $0.text = "2"
            $0.font = UIFont.pretendard(.title2)
        }
        
        thirdLabel.do {
            $0.text = "3"
            $0.font = UIFont.pretendard(.title2)
        }
        
        firstButton.do {
            $0.setTitle("C", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 5
        }
        
        secondButton.do {
            $0.setTitle("C", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 5
        }
        
        thirdButton.do {
            $0.setTitle("C", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 5
        }
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
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.centerY.equalTo(view.snp.centerY)
            $0.width.equalTo(40)
            $0.height.equalTo(25)
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
