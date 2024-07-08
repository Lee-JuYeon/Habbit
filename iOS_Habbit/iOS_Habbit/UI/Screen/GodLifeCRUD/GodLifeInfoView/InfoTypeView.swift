//
//  GodLifeMake.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/11/24.
//

import SwiftUI

struct InfoTypeView: View {
    
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    
    @State private var guideModel = GodLifeModel.guidModel
    @State private var isOpenType = false
    @State private var typeText = ""
    private func uploadUpdateType(){
        typeText = ""
    }
    
    var body: some View {
        Text(typeText)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .font(.system(size: 15, weight: .bold))
            .onAppear(perform: {
                switch(getGodLifeViewType){
                case .Create :
                    typeText = "클릭하여 타입 작성"
                case .Update :
                    typeText = getModel.type ?? "클릭하여 타입 업데이트"
                case .Joined, .Read :
                    typeText = getModel.type ?? "알 수 없는 타입"
                }
            })
            .onTapGesture {
                switch(getGodLifeViewType){
                case .Create :
                    isOpenType.toggle()
                case .Update :
                    isOpenType.toggle()
                case .Joined, .Read :
                    print("")
                }
            }
            .fullScreenCover(isPresented: $isOpenType) {
                Text("uploadUpdateType()를 이용해 업로드")
                    .onTapGesture {
                        isOpenType.toggle()
                    }
            }
    }
    
}

