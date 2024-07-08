//
//  RequestItem.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/4/24.
//

import SwiftUI

struct RequestItemView: View {
    
   
    private var getUserUID : String
    private var getIndex : Int
    private var getList : [String]
    init(
        setUserUID: String,
        setIndex: Int,
        setList : [String]
    ){
        self.getUserUID = setUserUID
        self.getIndex = setIndex
        self.getList = setList
    }
    
    private func getUserModel() -> UserModel{
        return UserModel.jiwonModel
    }
    @State private var expandableItem = false
    @State private var expandableDenied = false
    @State private var deniedReason = ""
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            HStack(alignment: VerticalAlignment.center, spacing: 10){
                Text("가입 신청자 : \(getUserModel().userName)")
                    .font(.system(size: 25, weight: .bold))
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                Text(expandableItem ? "닫기" : "🔍")
                    .font(.system(size: 20, weight: .bold))
                    .onTapGesture {
                        expandableItem.toggle()
                    }
            }
           
            
            if expandableItem {
                Text("💬 갓생러들이 작성한 평판")
                    .font(.system(size: 20, weight: .bold))

                VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVStack(alignment: HorizontalAlignment.leading, spacing: 2){
                            ForEach(getUserModel().peerReview, id: \.self){ review in
                                Text("🙍🏻 \(review)")
                                    .padding(5)
                                    .padding(5)

                            }
                        }
                    }
                }
               
                Text("✍🏻 자기소개")
                    .font(.system(size: 20, weight: .bold))

                Text(getUserModel().bio ?? "")
                
                HStack(alignment: VerticalAlignment.center, spacing: 10){
                    Spacer()
                    RequestDeniedButton(
                        setDeniedReason: $deniedReason,
                        setExpandableDenied: $expandableDenied,
                        setIndex: getIndex,
                        setList: getList
                    )
                    RequestAcceptButton(
                        setIndex: getIndex,
                        setList: getList
                    )
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .leading
                )
            }
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.colourBackground)
        )
        .padding(5)
    }
}

