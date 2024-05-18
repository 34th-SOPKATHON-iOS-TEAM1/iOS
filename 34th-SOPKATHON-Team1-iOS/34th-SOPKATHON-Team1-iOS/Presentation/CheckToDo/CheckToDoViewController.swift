//
//  CheckToDoViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit
import SnapKit
import Then

protocol TodoCellDelegate: AnyObject {
    func buttonStateChanged(buttonIdentifier: String, isPressed: Bool)
}

class CheckToDoViewController: UIViewController {
    
    private var mainSeeSawImageView = UIImageView()
    
    private var bottomRoundedView = UIView()
    
    private var centerLabel = UILabel()
    
    private var collectionView: UICollectionView!
    
    var buttonStates = [String: Bool]()
    
    private var todoData: [String] = ["","",""] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private var notTodoData: [String] = ["","",""] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayout()
        setupCollectionView()
        setUpProperty()
        getAll()
    }
    
    private func setUpProperty() {
        
        mainSeeSawImageView.do {
            $0.image = UIImage(named: "defaltSeesaw")
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
        
        bottomRoundedView.do {
            $0.backgroundColor = UIColor.mint100
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
        
        centerLabel.do {
            $0.text = "최종목표"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = UIFont.pretendard(.title1)
        }
    }
    
    private func setupLayout() {
        view.addSubview(mainSeeSawImageView)
        view.addSubview(bottomRoundedView)
        bottomRoundedView.addSubview(centerLabel)
        
        mainSeeSawImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(343)
        }
        
        bottomRoundedView.snp.makeConstraints {
            $0.top.equalTo(mainSeeSawImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(mainSeeSawImageView)
            $0.height.equalTo(72)
        }
        
        centerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cellWidth = (view.bounds.width  ) / 2
        layout.itemSize = CGSize(width: cellWidth , height: 300)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 12
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TodoCVC.self, forCellWithReuseIdentifier: "TodoCVC")
        collectionView.register(NotTodoCVC.self, forCellWithReuseIdentifier: "NotTodoCVC")
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(bottomRoundedView.snp.bottom).offset(40)
            make.leading.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(5)
        }
    }
    
    func getAll() {
        
        CheckService.shared.getCheckTodoNotTodoList { response in
            switch response {
            case .success(let data):
                guard let data = data as? GetAllResponseDTO else { return }
                
                self.centerLabel.text = data.data.goal
                self.notTodoData = data.data.notTodoContent
                self.todoData = data.data.todoContent
                self.collectionView.reloadData()
                
            default:
                return
            }
        }
    }
    
}

extension CheckToDoViewController :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //컬렉션뷰 같은거로 2개 재활용하면 데이터 넣기 애매해서 컬렉션뷰를 2개로 넣었습니다
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotTodoCVC", for: indexPath) as! NotTodoCVC
            cell.delegate = self
            cell.bind(data: notTodoData)
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoCVC", for: indexPath) as! TodoCVC
            cell.delegate = self
            cell.bind(data: todoData)
            return cell
        }
    }
    
}

extension CheckToDoViewController: TodoCellDelegate {
    
    func buttonStateChanged(buttonIdentifier: String, isPressed: Bool) {
        buttonStates[buttonIdentifier] = isPressed
        updateImageBasedOnState()
    }
    
    private func updateImageBasedOnState() {
        let todoCount = ["Todo1", "Todo2", "Todo3"].filter { buttonStates[$0, default: false] }.count
        let notTodoCount = ["NotTodo1", "NotTodo2", "NotTodo3"].filter { buttonStates[$0, default: false] }.count
        
        var imageName = "defaltSeesaw"  // Initial default image
        
        switch (todoCount, notTodoCount ) {
        case (0, 1): imageName = "unbalance01"
        case (0, 2): imageName = "unbalance03"
        case (0, 3): imageName = "unbalance07"
        case (1, 0): imageName = "unbalance02"
        case (1, 1): imageName = "balance1"
        case (1, 2): imageName = "unbalance04"
        case (1, 3): imageName = "unbalance09"
        case (2, 0): imageName = "unbalance05"
        case (2, 1): imageName = "unbalance06"
        case (2, 2): imageName = "balance2"
        case (2, 3): imageName = "unbalance08"
        case (3, 0): imageName = "unbalance10"
        case (3, 1): imageName = "unbalance11"
        case (3, 2): imageName = "unbalance12"
        case (3, 3): imageName = "balance3"
        default: imageName = "defaltSeesaw"
        }
        mainSeeSawImageView.image = UIImage(named: imageName)
        
        // Check if all buttons are pressed
        if allButtonsArePressed() {
            presentConfirmationAlert()
        }
    }
    
    
    private func allButtonsArePressed() -> Bool {
        let keys = ["Todo1", "Todo2", "Todo3", "NotTodo1", "NotTodo2", "NotTodo3"]
        return keys.allSatisfy { buttonStates[$0, default: false] }
    }
    
    private func presentConfirmationAlert() {
        DispatchQueue.main.async {
            let blurView = UIView()
            self.view.addSubview(blurView)
            blurView.do {
                $0.backgroundColor = .white
                $0.alpha = 0.50
                $0.frame = self.view.frame
            }
            
            let alertVC = ConfirmationAlertViewController()
            alertVC.modalPresentationStyle = .formSheet
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    
    private func getStateKey() -> String {
        let keys = ["Todo1", "Todo2", "Todo3", "NotTodo1", "NotTodo2", "NotTodo3"]
        return keys.map { buttonStates[$0, default: false] ? "1" : "0" }.joined()
    }
    
    
}


//#Preview {
//    CheckToDoViewController()
//}
