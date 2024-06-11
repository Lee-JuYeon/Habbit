//
//  RegisterView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI

struct RegisterView: View {
    
    /*
     struct UserModel : Hashable {
     let userUID : String
     let userName : String
     let selfieVerify : Bool
     let userImage : String
     let peerReview : [String]?
     let socialMedia : [String:String] // insta, youtube
     let bio : String?
     }
     */
    
    var body: some View {
        VStack(
            alignment : HorizontalAlignment.leading
        ){
            // email
            // password
            // email verify or mobile verify
            
            HStack(alignment : VerticalAlignment.top){
                // 이미지userImage
                VStack(alignment : HorizontalAlignment.leading){
                    // 이름userName + 사진인증 체크표시selfieVerify (방개설시에만)
                    // 소셜 미디어socialMedia [인스타, 유튜브]
                    // 자기소개bio
                    
                }
            }
        }
    }
}

