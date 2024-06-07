//
//  NotificationView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/6/24.
//

import SwiftUI

struct NotificationView: View {
    
    let notificationList : [NotificationModel]

    var body: some View {
        FoldableListView(
            setTitle: "📣 공지사항",
            setHeight: 200,
            setContent: {
                ForEach(notificationList, id: \.self){ model in
                    VStack(){
                        Text(model.title)
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
            }
        )
    }
}

