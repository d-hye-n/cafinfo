//
//  ViewController.swift
//  cafinfo
//
//  Created by 김도현 on 5/26/25.
//
#Preview{
    ViewController()
}

import UIKit
import SnapKit

class ViewController: UIViewController {
    static let identifier = "ViewController"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "24-2학기 학생식당 운영시간"
        label.font = UIFont(name:"Pretendard-Bold", size: 36)
        label.textAlignment = .left
        return label
    }()
    
    let location: UILabel = {
        let label = UILabel()
        label.text = "위치 학생회관 2층"
        label.font = UIFont(name:"Pretendard-Regular", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let number: UILabel = {
        let label = UILabel()
        label.text = "전화번호 041-560-1278"
        label.font = UIFont(name:"Pretendard-Regular", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.title = "학생식당 정보"
        
        setupViews()
        setupConstraints()
        
        
        
    }


}

