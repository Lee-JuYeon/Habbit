//
//  NotificationModel.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/5/24.
//

import SwiftUI

struct NotificationModel : Hashable {
    var title : String
    var notification : String
    var date : Date
}

extension NotificationModel {
    static let notificationlist : [NotificationModel] = [
        NotificationModel(
            title: "공지사항 타이틀 1",
            notification: "공지사항 내용 1",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        ),
        NotificationModel(
            title: "공지사항 타이틀 2",
            notification: "공지사항 내용 2",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        ),
        NotificationModel(
            title: "공지사항 타이틀 3",
            notification: "공지사항 내용 3",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        ),
        NotificationModel(
            title: "공지사항 타이틀 4",
            notification: "공지사항 내용 4",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        ),
        NotificationModel(
            title: "공지사항 타이틀 5",
            notification: "공지사항 내용 5",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        ),
        NotificationModel(
            title: "공지사항 타이틀 6",
            notification: "공지사항 내용 6",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        ),
        NotificationModel(
            title: "공지사항 타이틀 7",
            notification: "공지사항 내용 7",
            date: Date(timeIntervalSinceNow: -60 * 60 * 24) // 하루 전 날짜
        )
    ]
}
