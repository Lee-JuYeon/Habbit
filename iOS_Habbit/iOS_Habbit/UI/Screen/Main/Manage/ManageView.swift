//
//  UIColor.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/1/24.
//

import SwiftUI

struct ManageView : View {
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
    
    private let titleSize : CGFloat = 25
    var body : some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            ScrollView(
                Axis.Set.vertical
            ){
                LazyVStack(alignment : HorizontalAlignment.leading){
                    Text("내가 개설한 갓생")
                        .font(.system(size: titleSize))
                        .fontWeight(.bold)
                   
                    ForEach(GodLifeModel.dummyList, id: \.self){ model in
                        GodLifeCell(setModel: model) { cellModel in
                                // cellModel
                        }
                    }
                    
                    Text("내가 가입한 갓생")
                        .font(.system(size: titleSize))
                        .fontWeight(.bold)
                   
                    ForEach(GodLifeModel.dummyList, id: \.self){ model in
                        GodLifeCell(setModel: model) { cellModel in
                                // cellModel
                        }
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




