//
//  ProfileEditView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI

struct ProfileEditView: View {
    let setUserModel : UserModel
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            ZStack(alignment: .topLeading){
                HStack(
                    alignment : VerticalAlignment.top
                ){
                    VStack(
                        alignment : HorizontalAlignment.leading,
                        spacing: 10
                    ){
                        
                        SelfieView(
                            setImage: setUserModel.userImage,
                            setVerify: setUserModel.selfieVerify,
                            setSize: 150
                        )
                        
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
                    }
                    
                    // 자기소개
                    Text(setUserModel.bio ?? "")
                        .font(.system(size: 15))
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .multilineTextAlignment(.leading)
                    
                }
                
              
            }
        }
    }
  
}

