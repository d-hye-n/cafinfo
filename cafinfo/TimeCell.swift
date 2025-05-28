//
//  TimeCell.swift
//  cafinfo
//
//  Created by 김도현 on 5/27/25.
//

import UIKit
import SnapKit

final class TimeCell: UICollectionViewCell {
    static let reuseID = "TimeCell"
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let topBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        contentView.addSubview(bottomBorder)
        bottomBorder.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        contentView.addSubview(topBorder)
        topBorder.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(1)
        }
        backgroundColor = .white
        contentView.backgroundColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: String,
                   isHeaderRow: Bool,
                   showTopBorder: Bool,
                   bottomBorderThick: CGFloat = 1,
                   bottomColor: UIColor = .lightGray) {
        valueLabel.text = value
        let backgroundColor = isHeaderRow
        ? UIColor(white: 0.95, alpha: 1.0)
        : .white
        contentView.backgroundColor = backgroundColor
        topBorder.isHidden = !showTopBorder
        bottomBorder.snp.updateConstraints {
            $0.height.equalTo(bottomBorderThick)
        }
        bottomBorder.backgroundColor = bottomColor
    }
    
}

