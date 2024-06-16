//
//  ActivityListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/10/24.
//

import SwiftUI

struct ActivityListView: View {
    
    let setList : [ActivityModel]
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            Text("활동내역")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment : VerticalAlignment.top){
                    ForEach(setList, id: \.self){ model in
                        // 리뷰 리스트 아이탬
                        item(model: model)
                    }// ForEach
                }// LazyHStack
            }//Scrollview
        }//VStack
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
    
    private func item(model : ActivityModel) -> some View {
        return VStack(alignment : HorizontalAlignment.center){
            AsyncImage(
                url: URL(string: model.images.first!.image)
            ) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } placeholder : {
                ProgressView()
            }
            .frame(
                width: 100
            )
            
            Text(model.images.first!.date)
                .font(.system(size: 20))
        }
    }
}
