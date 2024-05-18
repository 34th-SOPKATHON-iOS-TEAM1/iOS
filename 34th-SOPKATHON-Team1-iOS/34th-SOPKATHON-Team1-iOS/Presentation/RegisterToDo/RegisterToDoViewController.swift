//
//  RegisterToDoViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit

final class RegisterToDoViewController: UIViewController {

    // MARK: - Properties
    
    private let rootView = RegisterToDoView()

    // MARK: - Life Cycles

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegate()
    }
}

extension RegisterToDoViewController {
    
    //MARK: - Private Method

    private func setupDelegate() {
        
    }
}
