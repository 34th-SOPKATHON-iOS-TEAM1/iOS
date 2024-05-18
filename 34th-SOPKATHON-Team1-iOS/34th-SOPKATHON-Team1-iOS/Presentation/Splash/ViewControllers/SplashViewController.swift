//
//  OnBoardingViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

import Lottie
import SnapKit
import Then

final class SplashViewController: UIViewController {
    
    // MARK: - UI Properties
        
    private let lottieView = LottieAnimationView()

    
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
        self.view.addSubview(lottieView)
    }
    
    func setLayout() {
        lottieView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(screenWidth - 32)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .white000)
    }
    
    func setSplash() {
        lottieView.do {
            $0.contentMode = .center
            $0.animation = .named("lottie")
            $0.loopMode = .playOnce
            $0.play(completion: {completed in
                if completed {
                    let onboardingVC = OnBoardingViewController()
                    self.navigationController?.pushViewController(onboardingVC, animated: true)
                }
            })
        }
    }
    
}
