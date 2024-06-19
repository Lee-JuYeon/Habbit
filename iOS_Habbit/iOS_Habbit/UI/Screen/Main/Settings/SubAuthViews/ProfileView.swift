//
//  ProfileView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI

struct ProfileView: View {
    
    let setUserModel : UserModel
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            VStack(
                alignment : HorizontalAlignment.leading
            ){
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
                        HStack(
                            alignment : VerticalAlignment.center,
                            spacing: 10
                        ){
                            Text(setUserModel.userName)
                                .font(.title2)
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
                        
                        Text("🏃🏻 경력")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
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
                                    Text(model.title)
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

                Text("수정하기")
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .frame(
                        maxWidth: .infinity,
                        alignment: Alignment.center
                    )
                    .background(
                        Color.colourSheet
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .onTapGesture {
                        // 수정뷰로 이동
                    }
                
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
}

