//
//  InfoTitleView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/25/24.
//

import SwiftUI

struct InfoTitleView: View {
    
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
    @State private var isOpenTitle = false
    @State private var newTitle = ""
    @State private var hint : String = ""
    private func manageTitleViewStrings(){
        switch getGodLifeViewType {
        case .Create:
            hint = guideModel.title
            newTitle = guideModel.title
        case .Update:
            hint = "갓생이름을 바꿀 수 있습니다"
            newTitle = getModel.title
        case .Read :
            hint = getModel.title
            newTitle = getModel.title
        case .Joined :
            hint = getModel.title
            newTitle = getModel.title
        }
    }
    
    var body: some View {
        Text(newTitle)
            .onAppear(perform: {
                manageTitleViewStrings()
            })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .font(.system(size: 30, weight: .bold))
            .onTapGesture {
                if getGodLifeViewType == .Update || getGodLifeViewType == .Create {
                    isOpenTitle.toggle()
                }
            }
            .bottomSheet(isOpen: $isOpenTitle) {
                VStack(){
                    TextField(
                        hint,
                        text: $newTitle
                    )
                    .onAppear(perform: {
                        if newTitle == "클릭하여 갓생 이름 설정" {
                            newTitle = ""
                        }
                    })
                    .onChange(of: newTitle) { newValue in
                        newTitle = newValue
                        print ("myMoney: \(newValue)")
                    }
                    .textFieldStyle(.roundedBorder)
                    
                    Text("완료")
                        .padding(5)
                        .font(.system(size: 20, weight: .bold))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        )
                        .padding(5)
                        .onTapGesture {
                            isOpenTitle.toggle()
                        }
                }.onDisappear(perform: {
                    if newTitle == "" {
                        newTitle = "클릭하여 갓생 이름 설정"
                    }
                })
            }
    }
}
