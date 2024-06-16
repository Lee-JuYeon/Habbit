//
//  UIColor.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/1/24.
//

import SwiftUI

struct ManageView : View {
    
    @EnvironmentObject private var screenVM : ScreenVM
    
    private let titleSize : CGFloat = 30
    var body : some View {
        ScrollView(
            Axis.Set.vertical
        ){
            LazyVStack(alignment : HorizontalAlignment.leading){
                createdGodLifeRoom()
                joinedGodLifeRoom()
            }
        }
        .background(Color.colourBackground)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
    
    
    @State var isCreatedSectionOpen = true
    private func createdGodLifeRoom() -> some View {
        let mList = GodLifeModel.dummyList
        return VStack(alignment: HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center){
                Text("내가 개설한 갓생")
                    .padding(10)
                    .font(.system(size: titleSize))
                    .fontWeight(.bold)
                    .padding(10)
                Image(isCreatedSectionOpen ? "image_arrow_up" : "image_arrow_down")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .onTapGesture {
                isCreatedSectionOpen.toggle()
            }
            
           
            if isCreatedSectionOpen {
                ForEach(mList, id: \.self){ model in
                    CreatedGodLifeCell(setModel: model) { cellModel in
                            // cellModel
                        screenVM.screenType = .GodLife_Edit
                        screenVM.pageIndex = 1
                        screenVM.currentGodLifeModel = cellModel
                    }
                }
            }
        }
    }
    
    @State var isJoinedSectionOpen = true
    private func joinedGodLifeRoom() -> some View {
        let mList = GodLifeModel.dummyList
        return VStack(alignment: HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center){
                Text("내가 가입한 갓생")
                    .padding(10)
                    .font(.system(size: titleSize))
                    .fontWeight(.bold)
                    .padding(10)
                Image(isJoinedSectionOpen ? "image_arrow_up" : "image_arrow_down")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .onTapGesture {
                isJoinedSectionOpen.toggle()
            }
            
           
            if isJoinedSectionOpen {
                ForEach(mList, id: \.self){ model in
                    GodLifeCell(setModel: model) { cellModel in
                            // cellModel
                        screenVM.screenType = .GodLife_Exit
                        screenVM.currentGodLifeModel = cellModel
                    }
                }
            }
        }
    }
   
}




