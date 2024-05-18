//
//  OnBoardingViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

final class OnBoardingViewController: UIViewController {

    // MARK: - UI Properties
    
    private let onBoardingView = OnBoardingView()
    
    
    // MARK: - Properties
        
    private let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
    }
    
}


// MARK: - Private Methods

private extension OnBoardingViewController {
    
    func setHierarchy() {
        self.view.addSubview(onBoardingView)
    }
    
    func setLayout() {
        onBoardingView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(56)
            $0.top.equalToSuperview().inset(statusBarHeight + 9)
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .white000)
    }
    
    func setDelegate() {
        self.onBoardingView.delegate = self
    }
    
}

// MARK: - Delegates

extension OnBoardingViewController: OnBoardingViewDelegate {
    
    func pushToRegisterToDoVC() {
        print("pushToRegisterToDoVC")
//        let registerVC = RegisterToDoViewController()
//        self.navigationController?.pushViewController(registerVC, animated: true)
    }
}
