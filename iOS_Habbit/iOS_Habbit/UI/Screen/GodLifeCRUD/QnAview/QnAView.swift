//
//  QnAView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/13/24.
//

import SwiftUI

struct QnAView: View {
    
    private var getList : [QnAModel]
    private var getGodLifeType : GodLifeViewType
    init(
        setList : [QnAModel],
        setGodLifeViewType : GodLifeViewType
    ){
        self.getList = setList
        self.getGodLifeType = setGodLifeViewType
    }
    
    private var myAuthUID = "uid1"
    private func mList() -> [QnAModel]{
        return getList.sorted { model1, model2 in
            if model1.questionUID == myAuthUID {
                true
            }else if model2.questionUID == myAuthUID {
                false
            }
            return false
        }
    }

    @State private var questionText = ""
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center, spacing: 2){
                Text("질의응답")
                    .font(.system(size: 30, weight: .bold))
                
                if getGodLifeType == .Joined {
                    QnAQuestionButton(setGodLifeViewType: getGodLifeType)
                }
            }
           
            
            HStack(alignment: VerticalAlignment.center, spacing: 0){
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack(alignment : HorizontalAlignment.leading){
                        ForEach(mList(), id: \.self){ model in
                            // 리뷰 리스트 아이탬
                            QnAItem(setModel: model, setType: getGodLifeType)
                        }// ForEach
                    }// LazyHStack
                }//Scrollview
            }
            .frame(
                height: 200
            )
        }//VStack
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
    
}



