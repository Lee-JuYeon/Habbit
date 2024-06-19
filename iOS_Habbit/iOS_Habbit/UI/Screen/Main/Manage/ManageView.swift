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
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment : HorizontalAlignment.leading){
                    createdGodLifeRoom(setGeo: geo)
                    joinedGodLifeRoom(setGeo: geo)
                }
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
    
    
    @State var isUpdateSectionOpen = true
    @State var isUpdateSheetOpen = false
    @State var godLifeModel : GodLifeModel = GodLifeModel.dummyList.first!
    private func createdGodLifeRoom(setGeo getGeo : GeometryProxy) -> some View {
        let mList = GodLifeModel.dummyList
        return LazyVStack(alignment: HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center){
                Text("내가 개설한 갓생")
                    .font(.system(size: titleSize))
                    .fontWeight(.bold)
                    .padding(10)
                Image(isUpdateSectionOpen ? "image_arrow_up" : "image_arrow_down")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            
            if isUpdateSectionOpen {
                ForEach(mList, id: \.self){ model in
                    GodLifeCell(setModel: model, setCellType: .Created) { cellModel in
                        godLifeModel = cellModel
                        isUpdateSheetOpen.toggle()
                    }
                }
            }
        }
        .onTapGesture {
            isUpdateSectionOpen.toggle()
        }
        .fullScreenCover(isPresented: $isUpdateSheetOpen) {
            GodLifeCRUD(
                setVisibleView: $isUpdateSheetOpen,
                setGodLifeModel: $godLifeModel,
                setGodLifeViewType: .Update
            )
        }
    }
    
    @State var isJoinedSectionOpen = true
    @State var isJoinedSheetOpen = false
    private func joinedGodLifeRoom(setGeo getGeo : GeometryProxy) -> some View {
        let mList = GodLifeModel.dummyList.filter { model in
            model.adminChecked == true
        }
        return VStack(alignment: HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center){
                Text("내가 가입한 갓생")
                    .font(.system(size: titleSize))
                    .fontWeight(.bold)
                    .padding(10)
                Image(isJoinedSectionOpen ? "image_arrow_up" : "image_arrow_down")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
           
            if isJoinedSectionOpen {
                ForEach(mList, id: \.self){ model in
                    GodLifeCell(setModel: model, setCellType: .Joined) { cellModel in
                        godLifeModel = cellModel
                        isJoinedSheetOpen.toggle()
                    }
                }
            }
        }
        .onTapGesture {
            print("asdfasdf")
            isJoinedSectionOpen.toggle()
        }
        .bottomSheet(isOpen: $isJoinedSheetOpen) {
            JoinedGodLifeView(setModel: godLifeModel, setVisible: $isJoinedSheetOpen)
        }
    }
}




