//
//  ViewLayout.swift
//  cafinfo
//
//  Created by 김도현 on 5/27/25.
//

import UIKit
import SnapKit

extension ViewController {
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(location)
        view.addSubview(number)
        view.addSubview(separator)
    }
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        
        location.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(20)
        }
        
      
        number.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(20)
        }
        
       
        separator.snp.makeConstraints {
            $0.top.equalTo(number.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
}
