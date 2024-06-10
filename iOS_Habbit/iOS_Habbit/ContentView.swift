//
//  ContentView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
        
    var body: some View {
        ZStack{
            TabView {
                AcademyView()
                    .tabItem {
                        Label("갓생", image: "image_up")
                    }

                ManageView()
                    .tabItem {
                        Label("갓생관리", image: "image_cards")
                    }

                SettingsView()
                    .tabItem {
                        Label("설정", image: "image_profile")
                    }

            }
            
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
