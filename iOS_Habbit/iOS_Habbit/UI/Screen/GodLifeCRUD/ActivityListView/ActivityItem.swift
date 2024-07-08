//
//  ActivityItem.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/6/24.
//

import SwiftUI

struct ActivityItem : View {
    private var getModel : ActivityModel
    init(setModel : ActivityModel){
        self.getModel = setModel
    }
    
    @State private var expandablePicture = false
    
    private func sheetView() -> some View {
        VStack {
            if let imagePath = getModel.images.first?.imagePath,
               let url = URL(string: imagePath) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text("이미지를 불러올 수 없습니다.")
            }
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            expandablePicture.toggle()
        }
    }
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.center){
            AsyncImage(
                url: URL(string: getModel.images.first!.imagePath)
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
            
            Text(getModel.images.first!.date)
                .font(.system(size: 20))
        }
        .onTapGesture {
            expandablePicture.toggle()
            print("clicked : \(expandablePicture)")
        }
        .fullScreenCover(isPresented: $expandablePicture) {
            sheetView()
        }
    }
}
