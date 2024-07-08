//
//  HostNameView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/26/24.
//

import SwiftUI

struct HostNameView: View {
    
    @Binding private var getUserModel : UserModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setUserModel: Binding<UserModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getUserModel = setUserModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    
    @State private var nameViewOpen = false
    @State private var nameText = ""
    
    var body: some View {
        Text(nameText)
            .onAppear(perform: {
                switch(getGodLifeViewType){
                case .Create:
                    nameText = "클릭하여 이름 설정"
                case .Update:
                    nameText = getUserModel.userName
                case .Joined, .Read:
                    nameText = getUserModel.userName
                }
            })
            .font(.system(size: 35))
            .fontWeight(.bold)
            .onTapGesture {
                switch(getGodLifeViewType){
                case .Create:
                    nameViewOpen.toggle()
                case .Update:
                    nameViewOpen.toggle()
                case .Joined, .Read:
                    nameViewOpen = false
                }
            }
            .fullScreenCover(isPresented: $nameViewOpen, onDismiss: {
                nameViewOpen = false
            }) {
                VStack(alignment : HorizontalAlignment.leading, spacing : 0){
                    TextField(
                        "변경할 이름을 작성하세요",
                        text: $nameText
                    )
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                    Text("저장")
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity
                        )
                        .font(.system(size: 20, weight: .bold))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                        )
                        .onTapGesture {
                            nameViewOpen.toggle()
                        }
                }
            }
    }
}

