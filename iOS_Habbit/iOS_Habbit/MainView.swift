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
        ZStack{
            switch(screenVM.screenType){
            case .MainView :
                mainView()
            case .GodLife_Detail :
                GodLifeDetail()
            case .GodLife_Make :
                GodLifeMake()
            default :
                mainView()
            }
            
           
            CustomBottomSheet(isOpen: $screenVM.sheetVisible) {
                switch(screenVM.sheetType){
                    case .GodLifeCell :
                        SheetAcademyFilter()
                }
            }
        }
    }
    
    private func mainView() -> some View {
        return CustomTabView(
            setTabViewStyle: .BottomNavigation,
            setTabBackgroundColour: .backgroundColour,
            setTabItemModels: [
                CustomTabItemModel(image: "image_up", title: "갓생"),
                CustomTabItemModel(image: "image_cards", title: "관리"),
                CustomTabItemModel(image: "image_profile", title: "프로필"),
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
