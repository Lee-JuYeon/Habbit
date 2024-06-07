//
//  AcademyView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI


struct AcademyView : View {
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
    
    var body : some View {
        VStack{
            AcademyHeader()
            
            RecyclerView(
                setAxis: RecyclerViewAxis.VERTICAL
            ) {
                ForEach(AcademyModel.dummyList, id:\.self){ model in
                    AcademyCell(setModel: model)
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
