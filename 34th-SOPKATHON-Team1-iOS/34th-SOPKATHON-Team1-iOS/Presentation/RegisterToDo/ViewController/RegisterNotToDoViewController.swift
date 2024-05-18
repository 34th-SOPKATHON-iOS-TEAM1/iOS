//
//  RegisterNotToDoViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

final class RegisterNotToDoViewController: UIViewController {

    // MARK: - Properties
    
    private let rootView = RegisterNotToDoView()

    // MARK: - Life Cycles

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupDelegate()
    }
}

extension RegisterNotToDoViewController {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        navigationController?.isNavigationBarHidden = true
    }

    private func setupDelegate() {
        
    }
}
