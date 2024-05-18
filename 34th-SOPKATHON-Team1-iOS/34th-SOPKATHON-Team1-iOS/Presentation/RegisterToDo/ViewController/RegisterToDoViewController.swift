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
        setupAddTarget()
    }
}

extension RegisterToDoViewController {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        navigationController?.isNavigationBarHidden = true
    }

    private func setupAddTarget() {
        rootView.clearButton1.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        rootView.clearButton2.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)

        rootView.clearButton3.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        rootView.previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        rootView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    func postToDo() {
        let text1 = self.rootView.todoTextField1.text ?? ""
        let text2 = self.rootView.todoTextField2.text ?? ""
        let text3 = self.rootView.todoTextField3.text ?? ""

        RegisterService.shared.postToDo(todoContent: PostTodoRequestBody(todoContent: [text1, text2, text3])) { response in
            switch response {
            case .success:
                let RegisterNotToDoVC = RegisterNotToDoViewController()
                
                self.navigationController?.pushViewController(RegisterNotToDoVC, animated: true)
            default:
                return
            }
        }
    }
    
    @objc func clearButtonTapped(_ button: UIButton) {
        switch button.tag {
        case 1:
            rootView.todoTextField1.text = ""
            rootView.todoTextField1.rightViewMode = .never
        case 2:
            rootView.todoTextField2.text = ""
            rootView.todoTextField2.rightViewMode = .never
        case 3:
            rootView.todoTextField3.text = ""
            rootView.todoTextField3.rightViewMode = .never
        default: break
        }
    }
    
    @objc func previousButtonTapped(_ button: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped(_ button: UIButton) {
        self.postToDo()
    }
}

