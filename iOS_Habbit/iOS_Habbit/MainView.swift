//
//  ContentView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct MainView: View {

   
    @EnvironmentObject private var screenVM : ScreenVM
        
    var body: some View {
        mainView()
    }
    
    private func mainView() -> some View {
        return CustomTabView(
            setTabViewStyle: CustomTabView.CustomTabViewStyle.BottomNavigation,
            setTabBackgroundColour: .backgroundColour,
            setTabItemModels: [
                CustomTabView.CustomTabItemModel(image: "image_up", title: "갓생"),
                CustomTabView.CustomTabItemModel(image: "image_cards", title: "관리"),
                CustomTabView.CustomTabItemModel(image: "image_profile", title: "프로필"),
            ],
            setSelectedIndex: $screenVM.pageIndex) { page in
                switch(page) {
                case 0 :
                    GodLifeView()
                case 1 :
                    ManageView()
                case 2 :
                    SettingsView()
                default :
                    GodLifeView()
                }
            }
    }
}
