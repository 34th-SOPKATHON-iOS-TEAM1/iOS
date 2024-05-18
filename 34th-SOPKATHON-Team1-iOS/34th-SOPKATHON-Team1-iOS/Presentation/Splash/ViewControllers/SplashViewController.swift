//
//  OnBoardingViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class SplashViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let graphicImageView: UIImageView = UIImageView()
    
    
    // MARK: - Properties
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setSplash()
    }
    
}


// MARK: - Private Methods

private extension SplashViewController {
    
    func setHierarchy() {
        self.view.addSubview(graphicImageView)
    }
    
    func setLayout() {
        graphicImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(screenWidth - 32)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .black000)
        
        graphicImageView.do {
            $0.image = UIImage(resource: .dummy8)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
    }
    
    func setSplash() {
        UIView.animate(withDuration: 2.0,
                       animations: {
            self.view.alpha = 0.0
        },
                       completion: { finish in
            let onBoardingVC = OnBoardingViewController()
            self.navigationController?.pushViewController(onBoardingVC, animated: false)
        })
    }
}
