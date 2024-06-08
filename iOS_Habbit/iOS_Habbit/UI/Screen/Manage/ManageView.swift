//
//  UIColor.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/1/24.
//

import SwiftUI

struct ManageView : View {
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
    
    var body : some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            ScrollView(
                Axis.Set.vertical
            ){
                VStack(alignment : HorizontalAlignment.leading){
                    FoldableListView(
                        setTitle: "내가 개설한 갓생",
                        setTitleSize: 25, 
                        setHeight: 400
                    ) {
                        ForEach(AcademyModel.dummyList, id: \.self){ model in
                            AcademyCell(setModel: model)
                        }
                    }
                    FoldableListView(
                        setTitle: "내가 가입한 갓생",
                        setTitleSize: 25,
                        setHeight: 400
                    ) {
                        ForEach(AcademyModel.dummyList, id: \.self){ model in
                            AcademyCell(setModel: model)
                        }
                    }
                    FoldableListView(
                        setTitle: "관심있는 갓생",
                        setTitleSize: 25,
                        setHeight: 400
                    ) {
                        ForEach(AcademyModel.dummyList, id: \.self){ model in
                            AcademyCell(setModel: model)
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




