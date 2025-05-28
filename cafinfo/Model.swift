//
//  Model.swift
//  cafinfo
//
//  Created by 김도현 on 5/27/25.
//

import UIKit

struct infoTableModel: Hashable {
    let period: String
    let startTime: String
    let endTime: String
}

enum Section: String, CaseIterable {
    case weekday = "평일 운영시간"
    case weekend = "주말 운영시간"
}

extension infoTableModel {
    static func weekdayTable() -> [infoTableModel] {
        return [
            infoTableModel(period: "시간", startTime: "시작시간", endTime: "마감시간"),
            infoTableModel(period: "아침", startTime: "8:00", endTime: "9:30"),
            infoTableModel(period: "점심", startTime: "11:30", endTime: "13:30"),
            infoTableModel(period: "저녁", startTime: "17:30", endTime: "18:30")
        ]
    }
    
    static func weekendTable() -> [infoTableModel] {
        return [
            infoTableModel(period: "시간", startTime: "시작시간", endTime: "마감시간"),
            infoTableModel(period: "아침", startTime: "미운영", endTime: "미운영"),
            infoTableModel(period: "점심", startTime: "11:30", endTime: "13:00"),
            infoTableModel(period: "저녁", startTime: "17:30", endTime: "18:30")
        ]
    }
}

