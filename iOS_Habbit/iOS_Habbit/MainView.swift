//
//  ContentView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
        
    @State private var pageIndex = 0
    var body: some View {
        ZStack{
            CustomTabView(
                setTabViewType: .BottomNavigation,
                setTabItemModels: [
                    CustomTabItemModel(image: "image_up", title: "갓생"),
                    CustomTabItemModel(image: "image_cards", title: "관리"),
                    CustomTabItemModel(image: "image_profile", title: "프로필"),
                ],
                setSelectedIndex: $pageIndex) { page in
                    switch(page) {
                    case 0 :
                        AcademyView()
                    case 1 :
                        ManageView()
                    case 2 :
                        SettingsView()
                    default :
                        AcademyView()
                    }
                    
                }

//            TabView {
//                AcademyView()
//                    .tabItem {
//                        Label("갓생", image: "image_up")
//                    }
//
//                ManageView()
//                    .tabItem {
//                        Label("갓생관리", image: "image_cards")
//                    }
//
//                SettingsView()
//                    .tabItem {
//                        Label("설정", image: "image_profile")
//                    }
//
//            }
            
            CustomBottomSheet(isOpen: $bottomSheetVM.sheetVisible) {
                switch(bottomSheetVM.sheetType){
                    case .AcademyCell :
                        SheetAcademyCell()
                    case .AdademyFilter :
                        SheetAcademyFilter()
                }
            }
        }
    }
}

struct BottomNavigationView : View {
    
    private var getBottomList: [AnyView]
    private var getScreenList: [AnyView]
        
    init(
        setBottomList: [AnyView],
        setScreenList: [AnyView]
    ) {
        self.getBottomList = setBottomList
        self.getScreenList = setScreenList
    }
    
    @State private var selectedIndex: Int = 0
        
    var body : some View {
        VStack{
            
        }
    }
}
