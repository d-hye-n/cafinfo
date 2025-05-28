//
//  ViewController.swift
//  cafinfo
//
//  Created by 김도현 on 5/26/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    static let identifier = "ViewController"
    let sections : [Section] = Section.allCases
    let sectionModels : [[infoTableModel]] = [
        infoTableModel.weekdayTable(),
        infoTableModel.weekendTable()
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "24-2학기 학생식당 운영시간"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    let location: UILabel = {
        let label = UILabel()
        label.text = "위치  학생회관 2층"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    let number: UILabel = {
        let label = UILabel()
        label.text = "전화번호  041-560-1278"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightergray
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = makeTableLayout(cellHeight: 40, horizontalInset: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseID)
        collectionView.register(TimeCell.self, forCellWithReuseIdentifier: TimeCell.reuseID)
        collectionView.register(SectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SectionFooterView.reuseID)
        return collectionView
    }()
    
    let updateDate: UILabel = {
        let label = UILabel()
        label.text = "2024.03.09 업데이트"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "학생식당정보"
        
        setupViews()
        setupConstraints()
        
    }

}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionModels[section].count * 3
    }
    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: TimeCell.reuseID,
            for: indexPath
        ) as! TimeCell
        
        
        let models = sectionModels[indexPath.section]
        let row = indexPath.item / 3
        let col = indexPath.item % 3
        let model = models[row]
        
        let text: String = {
            switch col {
            case 0: return model.period
            case 1: return model.startTime
            case 2: return model.endTime
            default: return ""
            }
        }()
        
        let isHeaderRow = (row == 0)
        let showTopBorder = (row == 0)
        let isLastRow = row == sectionModels[indexPath.section].count - 1
        let borderThinkness: CGFloat = (isHeaderRow || isLastRow) ? 1 : 0.5
        let bottomgroundColor: UIColor = (isHeaderRow || isLastRow) ? .lightGray : .lightGray
        
        cell.configure(with: text,
                       isHeaderRow: isHeaderRow,
                       showTopBorder: showTopBorder,
                       bottomBorderThick: borderThinkness,
                       bottomColor: bottomgroundColor)
        return cell
    }
    func collectionView(_ cv: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = cv.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.reuseID,
                for: indexPath
            ) as! SectionHeaderView
            let sectionType = sections[indexPath.section]
            header.configure(with: sectionType.rawValue)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = cv.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionFooterView.reuseID,
                for: indexPath
            ) as! SectionFooterView
            footer.backgroundColor = .clear
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

