//
//  TimeCell.swift
//  cafinfo
//
//  Created by 김도현 on 5/27/25.
//

import UIKit
import SnapKit

final class TimeCell: UICollectionViewCell {
    static let reuseID = "InfoTableCell"
    private let stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        contentView.addSubview(stack)
        stack.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(columns: [String], isHeader: Bool) {
        stack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        columns.forEach { title in
            let lbl = UILabel()
            lbl.text = title
            lbl.textAlignment = .center
            lbl.font = .systemFont(ofSize: 14, weight: isHeader ? .semibold : .regular)
            stack.addArrangedSubview(lbl)
        }
    }
}

