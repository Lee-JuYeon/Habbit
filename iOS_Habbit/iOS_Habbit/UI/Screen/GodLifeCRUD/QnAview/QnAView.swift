//
//  QnAView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/13/24.
//

import SwiftUI

struct QnAView: View {
    
    let setList : [QnAModel]
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            Text("질의응답")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment : HorizontalAlignment.leading){
                    ForEach(setList, id: \.self){ model in
                        // 리뷰 리스트 아이탬
                        item(model: model)
                    }// ForEach
                }// LazyHStack
            }//Scrollview
            .frame(
                height: 200
            )
        }//VStack
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
    
    
    private func item(model : QnAModel) -> some View {
        /*
         let academyUID : String
         let question : String
         let questionUID : String
         let answer : String
         */
        return VStack(alignment : HorizontalAlignment.leading){
            Text(model.question)
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            Text("💁🏻 \(model.answer)")
                .font(.system(size: 20))
            
        }
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
    }
}

