//
//  AcademyView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI


struct GodLifeView : View {
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
    @EnvironmentObject private var screenVM : ScreenVM
    
    @State private var dataList : [GodLifeModel] = GodLifeModel.dummyList
    @State private var filterString = ""
    
    var body : some View {
        
        VStack{
            headerView()
            
            RecyclerView(
                setAxis: RecyclerViewAxis.VERTICAL
            ) {
                ForEach(textfiledFilter(list: dataList), id:\.self){ model in
                    GodLifeCell(setModel: model) { cellModel in
                            // cellModel
                        screenVM.screenType = .GodLife_Detail
                        screenVM.currentGodLifeModel = cellModel
                    }
                }
            }
        }
        .background(Color.colourBackground)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .center
        )
    }
    
    private func headerView() -> some View {
        return HStack(
            alignment : VerticalAlignment.center
           ){
               TextField(
                   "Enter some text",
                   text: $filterString,
                   onEditingChanged: { (isEditing) in
                       
                   }
               )
               .padding(5)
               .background(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(Color.black, lineWidth: 1)
               )
               .padding(1)

               
               // 갓생추가
               Image("image_add")
                   .resizable()
                   .frame(
                        width: 30,
                        height: 30
                   )
                   .onTapGesture {
                       screenVM.screenType = .GodLife_Make
                   }
               
               // 필터링
               Image( "image_filter")
                   .resizable()
                   .frame(
                        width: 30,
                        height: 30
                   )
                   .onTapGesture {
                       withAnimation {
                           withAnimation {
                               bottomSheetVM.sheetType = .AdademyFilter
                               bottomSheetVM.sheetVisible.toggle()
                           }
                       }
                   }
           }
           .padding(10)
    }
    
    private func filterAdminChecked(list : [GodLifeModel]) -> [GodLifeModel]{
        return list.filter { model in
            model.adminChecked == true
        }
    }
    
    private func textfiledFilter(list : [GodLifeModel]) -> [GodLifeModel] {
        return list.filter { model in
            let matchesFilterString = filterString.isEmpty || model.title.contains(filterString)
            return matchesFilterString && model.adminChecked
        }
    }
}
