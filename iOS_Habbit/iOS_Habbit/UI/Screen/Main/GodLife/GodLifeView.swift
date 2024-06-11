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
    
    var body : some View {
        
        VStack{
            GodLifeHeader()
            
            RecyclerView(
                setAxis: RecyclerViewAxis.VERTICAL
            ) {
                ForEach(GodLifeModel.dummyList, id:\.self){ model in
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
}
