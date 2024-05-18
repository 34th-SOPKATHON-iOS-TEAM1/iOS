//
//  CheckToDoViewController.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 윤희슬 on 5/19/24.
//

import UIKit
import SnapKit
import Then

class CheckToDoViewController: UIViewController {
    
    private var mainSeeSawImageView = UIImageView()
    
    private var bottomRoundedView = UIView()
    
    private var centerLabel = UILabel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayout()
        setupCollectionView()
        setUpProperty()
    }
    
    private func setUpProperty() {
        
        mainSeeSawImageView.do {
            $0.image = UIImage(named: "dummy9")
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
        
        bottomRoundedView.do {
            $0.backgroundColor = UIColor.gray200
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
    
    
}

extension CheckToDoViewController :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //컬렉션뷰 같은거로 2개 재활용하면 데이터 넣기 애매해서 컬렉션뷰를 2개로 넣었습니다
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotTodoCVC", for: indexPath) as! NotTodoCVC
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoCVC", for: indexPath) as! TodoCVC
            return cell
        }
    }
    
    
}

#Preview {
    CheckToDoViewController()
}
