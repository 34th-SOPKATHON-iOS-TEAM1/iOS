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
        setupAddTarget()
    }
}

extension RegisterNotToDoViewController {
    
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
    
    func postNotToDo() {
        let text1 = self.rootView.notTodoTextField1.text ?? ""
        let text2 = self.rootView.notTodoTextField2.text ?? ""
        let text3 = self.rootView.notTodoTextField3.text ?? ""

        RegisterService.shared.postNotToDo(todoContent: PostNotTodoRequestBody(notTodoContent: [text1, text2, text3])) { response in
            switch response {
            case .success:
                let CheckToDoVC = CheckToDoViewController()
                
                self.navigationController?.pushViewController(CheckToDoVC, animated: true)
            default:
                return
            }
        }
    }
    
    @objc func clearButtonTapped(_ button: UIButton) {
        switch button.tag {
        case 1:
            rootView.notTodoTextField1.text = ""
            rootView.notTodoTextField1.rightViewMode = .never
        case 2:
            rootView.notTodoTextField2.text = ""
            rootView.notTodoTextField2.rightViewMode = .never
        case 3:
            rootView.notTodoTextField3.text = ""
            rootView.notTodoTextField3.rightViewMode = .never
        default: break
        }
    }
    
    @objc func previousButtonTapped(_ button: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped(_ button: UIButton) {
        self.postNotToDo()
    }

}
