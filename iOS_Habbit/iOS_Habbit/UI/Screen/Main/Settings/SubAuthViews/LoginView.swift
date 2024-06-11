//
//  LoginView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var getEmail : String
    @Binding var getPassword : String
    
    var body: some View {
        LazyVStack(alignment : HorizontalAlignment.leading){
            TextField(
                "Email",
                text: $getEmail
            )
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            TextField(
                "Password",
                text: $getPassword
            )
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            Text("LOG IN")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(
                    maxWidth : .infinity
                )
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.colourSheet)
                )
                .onTapGesture {
                    // 로그인 버튼
                }
            
            Divider()
            
            Text("계정이 없는 경우, 아래 버튼을 눌러 계정을 생성하세요")
            LazyHStack(alignment : VerticalAlignment.center){
                Image("image_email")
                Image("image_google")
                Image("image_apple")
            }
            .frame(
                maxWidth : .infinity
            )
        }
    }
    
   
}
