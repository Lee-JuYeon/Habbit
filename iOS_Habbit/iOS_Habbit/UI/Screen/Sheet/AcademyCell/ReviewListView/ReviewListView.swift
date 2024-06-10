//
//  ReviewListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/9/24.
//

import SwiftUI

struct ReviewListView: View {
    
    let setList : [ReviewModel]
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            Text("리뷰")
                .font(.system(size: 30))
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment : VerticalAlignment.top){
                    ForEach(setList ?? [], id: \.self){ model in
                        // 리뷰 리스트 아이탬
                        item(model: model)
                    }// ForEach
                }// LazyHStack
            }//Scrollview
        }// vstack
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
    
    private func item(model : ReviewModel) -> some View {
        return HStack(alignment : VerticalAlignment.top){
            if(model.image != nil){
                AsyncImage(
                    url: URL(string: model.image!)
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
            }
            
            LazyVStack(alignment : HorizontalAlignment.leading){
                starView(startPoint: model.stars)
                ScrollView(.vertical, showsIndicators: false){
                    Text(model.reviews)
                }
            }
            .frame(
                width: 100
            )
            
            
        }
        .padding(5)
        .background(Color.colourSheet)//HStack
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    
    private func starView(startPoint : Double) -> some View {
        return ZStack(alignment : .center){
            let imageSize = 30.0
            Image("image_star")
                .resizable()
                .scaledToFit()
                .frame(
                    width: imageSize,
                    height: imageSize
                )
            Text(String(format: "%.1f", startPoint))
                .frame(
                    width: imageSize,
                    height: imageSize
                )
                .padding(EdgeInsets(top: 5, leading: 2, bottom: 0, trailing: 0))
                .font(.system(size: 8))
                
        }
    }
}
