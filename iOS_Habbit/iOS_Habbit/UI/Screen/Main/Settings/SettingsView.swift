//
//  ProfileView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI


struct SettingsView : View {
    
    var body : some View {
        ScrollView(
            Axis.Set.vertical
        ){
            LazyVStack(alignment:HorizontalAlignment.leading){
                AuthView()
                NotificationView(notificationList: NotificationModel.notificationlist)
                ContactView()
            }
        }
        .padding(5)
        .background(Color.colourBackground)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}
