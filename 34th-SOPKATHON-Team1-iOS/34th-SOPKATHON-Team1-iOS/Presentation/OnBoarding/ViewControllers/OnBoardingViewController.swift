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
        self.view.addSubview(graphicImageView)
    }
    
    func setLayout() {
        graphicImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo((screenWidth - 32) * (385 / 343))
            $0.top.equalToSuperview().inset(statusBarHeight + 9)
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .white000)
        
        graphicImageView.do {
            $0.image = UIImage(resource: .dummy8)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
    }
    
}
