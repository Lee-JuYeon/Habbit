//
//  QnAQuestionButton.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/5/24.
//

import SwiftUI

struct QnAQuestionButton : View {
    private var getGodLifeViewType : GodLifeViewType
    init(
        setGodLifeViewType : GodLifeViewType
    ){
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    @State private var questionSheetOpen = false
    @State private var getQuestionText = ""

    var body: some View {
        Text("🖋️ 질문하기")
            .padding(5)
            .font(.system(size: 17, weight: .bold))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            )
            .padding(
                EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)
            )
            .onTapGesture {
                questionSheetOpen.toggle()
            }
            .fullScreenCover(isPresented: $questionSheetOpen) {
                VStack(alignment: HorizontalAlignment.leading, spacing: 5){
                    TextField(
                        "질문은 입력해주세요",
                        text: $getQuestionText
                    )
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .textFieldStyle(.roundedBorder)
                    
                    Text("작성완료")
                        .padding(5)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        )
                        .onTapGesture {
                            print("질문내용 : \(getQuestionText)")
                            questionSheetOpen.toggle()
                        }
                }
            }
    }
}
