//
//  UIColor.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/1/24.
//

import SwiftUI

struct ManageView : View {
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
    @EnvironmentObject private var screenVM : ScreenVM
    
    private let titleSize : CGFloat = 30
    var body : some View {
        ScrollView(
            Axis.Set.vertical
        ){
            LazyVStack(alignment : HorizontalAlignment.leading){
                Text("내가 개설한 갓생")
                    .padding(10)
                    .font(.system(size: titleSize))
                    .fontWeight(.bold)
                    .padding(10)
               
                ForEach(GodLifeModel.dummyList, id: \.self){ model in
                    GodLifeCell(setModel: model) { cellModel in
                            // cellModel
                        screenVM.screenType = .GodLife_Edit
                        screenVM.currentGodLifeModel = cellModel
                    }
                }
                
                Text("내가 가입한 갓생")
                    .padding(10)
                    .font(.system(size: titleSize))
                    .fontWeight(.bold)
                    .padding(10)
                
                ForEach(GodLifeModel.dummyList, id: \.self){ model in
                    GodLifeCell(setModel: model) { cellModel in
                            // cellModel
                        screenVM.screenType = .GodLife_Exit
                        screenVM.currentGodLifeModel = cellModel
                    }
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
    
   
}




