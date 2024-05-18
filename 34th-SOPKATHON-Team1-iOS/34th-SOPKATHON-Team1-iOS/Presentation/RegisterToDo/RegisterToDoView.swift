//
//  RegisterToDoView.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 조혜린 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class RegisterToDoView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let viewTitleLabel = UILabel()
    private let dividerView = UIView()
    private let stepLabel = UILabel()
    private let titleLabel = UILabel()
    private let discriptionLabel = UILabel()

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

extension RegisterToDoView {
    
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
            $0.text = "1/2"
            $0.textColor = .gray600
            $0.font = .pretendard(.title1)
        }
        
        titleLabel.do {
            $0.text = "TO-DO"
            $0.textColor = .black000
            $0.font = .pretendard(.heading1)
        }
        
        discriptionLabel.do {
            $0.text = "TO-DO에 대한 설명이 간단하게 들어갑니다."
            $0.textColor = .gray800
            $0.font = .pretendard(.title2)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            viewTitleLabel,
            dividerView
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
            $0.bottom.equalTo(viewTitleLabel.snp.bottom).inset(15.5)
        }
    }
    
    //MARK: - Method
    
}
