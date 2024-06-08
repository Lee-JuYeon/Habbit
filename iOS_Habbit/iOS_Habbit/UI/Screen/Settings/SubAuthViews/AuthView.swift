//
//  AuthView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI

struct AuthView: View {
    
    @State private var auth : Bool = true
    @State private var editProfile : Bool = false
    @State private var requireRegister : Bool = false
    @State private var getEmail : String = ""
    @State private var getPassword : String = ""
    
    var body: some View {
        LazyVStack(alignment:HorizontalAlignment.leading){
            if auth == true && editProfile == false {// 계정이 있는경우, 프로필 뷰
                ProfileView(setUserModel: UserModel.saeKyeongModel)
            }else if auth == true && editProfile == true{ // 프로필 수정뷰
                ProfileEditView(setUserModel: UserModel.jiwonModel)
            }else if auth == false && requireRegister == false{ // 계정이 없는 경우, 계정 생성이 필요 없는 경우 -> 로그인 뷰
                LoginView(getEmail: $getEmail, getPassword: $getPassword)
            }else if auth == false && requireRegister == true{ // 계정이 없는 경우, 계정 생성이 필요한 경우 -> 가입뷰
                RegisterView()
            }else{
                LoginView(getEmail: $getEmail, getPassword: $getPassword)
            }
        }
    }
}

