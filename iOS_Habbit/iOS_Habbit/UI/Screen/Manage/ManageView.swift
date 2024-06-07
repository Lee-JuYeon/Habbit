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
                    mView(setGeo: geo, setTitle: "내가 개설한 갓생", setList: AcademyModel.dummyList)
                    mView(setGeo: geo, setTitle: "내가 가입한 갓생", setList: AcademyModel.dummyList)
                    mView(setGeo: geo, setTitle: "관심있는 갓생", setList: AcademyModel.dummyList)
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
    
   
    private func mView(setGeo : GeometryProxy, setTitle : String, setList : [AcademyModel]) -> some View {
        let width = setGeo.size.width
        let height = setGeo.size.height
        
        @State var arrow = "🔽"
        
        return VStack{
            HStack(
                alignment : VerticalAlignment.center
            ){
                Text(setTitle)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding()
                
                Text(arrow)
            }
            .onTapGesture {
//                if arrow == "🔽"{
//                    arrow = "🔼"
//                }else{
//                    arrow = "🔽"
//                }
            }
            .frame(
                width: width,
                height: height/10 * 1,
                alignment: .leading
            )
            
//            if arrow == "🔼" {
                RecyclerView(
                    setAxis: .VERTICAL
                ) {
                    ForEach(setList, id: \.self) { model in
                        AcademyCell(setModel: model)
                    }
                }
                .frame(
                    width: width,
                    height: height/10 * 4,
                    alignment: .leading
                )
//            }
        }
        .frame(
            width: width,
            height: height/10 * 5,
            alignment: .leading
        )
    }
}




