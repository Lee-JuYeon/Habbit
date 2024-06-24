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
    @State var isUpdateBottomSheetOpen = false
    @State var isJoinedBottomSheetOpen = false

    @State var godLifeModel : GodLifeModel = GodLifeModel.dummyList.first!
    var body : some View {
        let createdList = GodLifeModel.dummyList
        let joinedList = GodLifeModel.dummyList.filter { model in
            model.adminChecked == true
        }
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment : HorizontalAlignment.leading){
                    Text("내가 개설한 갓생")
                        .font(.system(size: titleSize))
                        .fontWeight(.bold)
                        .padding(10)
                    ForEach(createdList, id: \.self){ model in
                        GodLifeCell(setModel: model, setCellType: .Update) { cellModel in
                            godLifeModel = cellModel
                            isUpdateBottomSheetOpen.toggle()
                        }
                    }
                }
                .fullScreenCover(isPresented: $isUpdateBottomSheetOpen) {
                    GodLifeCRUD(
                        setVisibleView: $isUpdateBottomSheetOpen,
                        setGodLifeModel: $godLifeModel,
                        setGodLifeViewType: GodLifeViewType.Update
                    )
                }
                
                LazyVStack(alignment : HorizontalAlignment.leading){
                    Text("내가 가입한 갓생")
                        .font(.system(size: titleSize))
                        .fontWeight(.bold)
                        .padding(10)
                    ForEach(joinedList, id: \.self){ model in
                        GodLifeCell(setModel: model, setCellType: .Joined) { cellModel in
                            godLifeModel = cellModel
                            isJoinedBottomSheetOpen.toggle()
                        }
                    }
                }
                .fullScreenCover(isPresented: $isJoinedBottomSheetOpen) {
                    GodLifeCRUD(
                        setVisibleView: $isJoinedBottomSheetOpen,
                        setGodLifeModel: $godLifeModel,
                        setGodLifeViewType: GodLifeViewType.Joined
                    )
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
    
//    
////    @State var isUpdateSectionOpen = true
// 
//    private func createdGodLifeRoom(setGeo getGeo : GeometryProxy) -> some View {
//        let mList = GodLifeModel.dummyList
//        return LazyVStack(alignment: HorizontalAlignment.leading){
//            HStack(alignment: VerticalAlignment.center){
//                Text("내가 개설한 갓생")
//                    .font(.system(size: titleSize))
//                    .fontWeight(.bold)
//                    .padding(10)
////                Image(isUpdateSectionOpen ? "image_arrow_up" : "image_arrow_down")
////                    .resizable()
////                    .renderingMode(.template)
////                    .scaledToFit()
////                    .frame(width: 30, height: 30)
//            }
//            
////            if isUpdateSectionOpen {
//                ForEach(mList, id: \.self){ model in
//                    GodLifeCell(setModel: model, setCellType: .Created) { cellModel in
//                        godLifeModel = cellModel
//                        isUpdateSheetOpen.toggle()
//                    }
//                }
////            }
//        }
////        .onTapGesture {
////            isUpdateSectionOpen.toggle()
////        }
//        .fullScreenCover(isPresented: $isUpdateBottomSheetOpen) {
//            GodLifeCRUD(
//                setVisibleView: $isUpdateBottomSheetOpen,
//                setGodLifeModel: $godLifeModel,
//                setGodLifeViewType: .Update
//            )
//        }
//    }
//    
//    private func joinedGodLifeRoom(setGeo getGeo : GeometryProxy) -> some View {
//        let mList = GodLifeModel.dummyList.filter { model in
//            model.adminChecked == true
//        }
//        return LazyVStack(alignment: HorizontalAlignment.leading){
//            HStack(alignment: VerticalAlignment.center){
//                Text("내가 가입한 갓생")
//                    .font(.system(size: titleSize))
//                    .fontWeight(.bold)
//                    .padding(10)
////                Image(isJoinedListOpen ? "image_arrow_up" : "image_arrow_down")
////                    .resizable()
////                    .renderingMode(.template)
////                    .scaledToFit()
////                    .frame(width: 30, height: 30)
//            }
//            
//            ForEach(mList, id: \.self){ model in
//                GodLifeCell(setModel: model, setCellType: .Joined) { cellModel in
//                    godLifeModel = cellModel
//                    isJoinedBottomSheetOpen.toggle()
//                }
//            }
//        }
////        .onTapGesture {
////            isJoinedListOpen.toggle()
////        }
//        .fullScreenCover(isPresented: $isJoinedBottomSheetOpen) {
//            GodLifeCRUD(
//                setVisibleView: $isJoinedBottomSheetOpen,
//                setGodLifeModel: $godLifeModel,
//                setGodLifeViewType: .Joined
//            )
//        }
//    }

}




