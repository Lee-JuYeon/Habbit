//
//  HostBioView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/27/24.
//

import SwiftUI

struct HostBioView: View {
    
    @State private var userModel: UserModel
    private var godLifeViewType: GodLifeViewType
    
    init(setUserModel: UserModel, setGodLifeViewType: GodLifeViewType) {
        _userModel = State(initialValue: setUserModel)
        self.godLifeViewType = setGodLifeViewType
    }
    
    @State private var bioText = ""
    @State private var isOpenSheet = false
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                Text("자기소개")
                    .font(.system(size: 15, weight: .bold))

                
                if godLifeViewType == .Create || godLifeViewType == .Update {
                    Button(action: {
                        // 수정 액션 추가
                        isOpenSheet.toggle()
                    }) {
                        Text("수정")
                            .font(.system(size: 15))
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                            )
                    }
                }
            }
            // 자기소개
            ScrollView(.vertical, showsIndicators: false) {
                Text(bioText)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(
            height: 150
        )
        .fullScreenCover(isPresented: $isOpenSheet, onDismiss: {
            isOpenSheet = false
        }, content: {
            VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                TextField(
                    "자기소개 글을 작성해주세요",
                    text: $bioText
                )
                .multilineTextAlignment(.leading)
                .textFieldStyle(.roundedBorder)
                Text("완료")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .center
                    )
                    .onTapGesture {
                        isOpenSheet.toggle()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }
        })
        .onAppear {
            switch(godLifeViewType){
            case .Create :
                bioText = ""
            case .Update :
                bioText = userModel.bio ?? ""
            case .Joined, .Read :
                bioText = userModel.bio ?? ""
            }
        }
        
       
    }
}

