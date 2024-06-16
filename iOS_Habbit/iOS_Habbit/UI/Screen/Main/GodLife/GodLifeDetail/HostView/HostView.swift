//
//  HostView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/10/24.
//

import SwiftUI

struct HostView: View {
    
    let setUserModel : UserModel
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            HStack(
                alignment : VerticalAlignment.center,
                spacing: 10
            ){
                Text(setUserModel.userName)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                
                SocialView(
                    setID: setUserModel.socialMedia["insta"],
                    setSocialType: .INSTA
                )
                SocialView(
                    setID: setUserModel.socialMedia["youtube"],
                    setSocialType: .YOUTUBE
                )
            }
            
            HStack(
                alignment : VerticalAlignment.top
            ){
                SelfieView(
                    setImage: setUserModel.userImage,
                    setVerify: setUserModel.selfieVerify,
                    setSize: 150
                )
                
                VStack(
                    alignment : HorizontalAlignment.leading,
                    spacing: 0
                ){
                    Text("경력")
                        .frame(
                            maxWidth: .infinity,
                            alignment: Alignment.leading
                        )
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(CareerModel.dummyList, id: \.self){ model in
                            LazyVStack(
                                alignment : HorizontalAlignment.leading
                            ){
                                Text(model.titie)
                                    .font(.system(size: 18))
                                    .lineLimit(1)
                                Text(model.career)
                                    .font(.system(size: 15))
                                    .lineLimit(1)
                            }
                            .padding(5)
                            .background(
                                Color.colourSheet
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    idealHeight: 150,
                    maxHeight: .infinity
                )
            }
            
            // 자기소개
            Text(setUserModel.bio ?? "")
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
            
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
}

