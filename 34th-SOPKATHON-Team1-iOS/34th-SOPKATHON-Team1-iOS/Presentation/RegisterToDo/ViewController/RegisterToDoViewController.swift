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
        
        setupStyle()
        setupDelegate()
    }
}

extension RegisterToDoViewController {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        navigationController?.isNavigationBarHidden = true
    }

    private func setupDelegate() {
        rootView.setupTextFieldDelegate(self)
    }
}

extension RegisterToDoViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 2
        textField.backgroundColor = .lightGray
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderWidth = 0
        textField.backgroundColor = .gray100
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
}
