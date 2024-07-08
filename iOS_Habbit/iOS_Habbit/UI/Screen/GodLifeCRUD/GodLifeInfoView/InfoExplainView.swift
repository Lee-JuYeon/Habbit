//
//  ManageGodLifeCell.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/14/24.
//

import SwiftUI

struct InfoExplainView : View {
    
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
    @State private var isOpenExplain = false
    @State private var explainText = ""
    private func uploadUpdateExplain(){
        explainText = ""
    }
    
    var body : some View {
        Text(explainText)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .onAppear(perform: {
                switch(getGodLifeViewType){
                case .Create :
                    explainText = "클릭하여 갓생 내용 작성"
                case .Update :
                    explainText = getModel.explain
                case .Joined, .Read :
                    explainText = getModel.explain
                }
            })
            .onTapGesture {
                switch(getGodLifeViewType){
                case .Create :
                    isOpenExplain.toggle()
                case .Update :
                    isOpenExplain.toggle()
                case .Joined, .Read :
                    print("")
                }
            }
            .fullScreenCover(isPresented: $isOpenExplain) {
                Text("uploadUpdateBio()를 이용해 업로드")
                    .onTapGesture {
                        isOpenExplain.toggle()
                    }
            }
    }
    
}
