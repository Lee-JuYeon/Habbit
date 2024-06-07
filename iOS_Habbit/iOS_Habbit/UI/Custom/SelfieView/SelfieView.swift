//
//  SelfieView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI

struct SelfieView: View {
    
    let setImage : String
    let setVerify : Bool
    let setSize : CGFloat
    
    var body: some View {
        ZStack(alignment : .topTrailing){
            AsyncImage(
                url: URL(string: setImage)
            ) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } placeholder : {
                ProgressView()
            }
            .frame(
                width: setSize
            )
            
            if(setVerify){
                Image("image_verify")
                    .resizable()
                    .frame(
                        width: 20,
                        height: 20
                    )
            }
            
        }
    }
}
