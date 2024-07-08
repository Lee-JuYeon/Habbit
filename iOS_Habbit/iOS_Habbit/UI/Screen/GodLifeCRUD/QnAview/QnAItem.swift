//
//  QnAItem.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/5/24.
//

import SwiftUI

struct QnAItem : View {
    private var getModel : QnAModel
    private var getType : GodLifeViewType
    init(
        setModel : QnAModel,
        setType : GodLifeViewType
    ){
        self.getModel = setModel
        self.getType = setType
    }
    
    private func writeReply(){
        
    }
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            Text(getModel.question)
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            Text("💁🏻 \(getModel.answer)")
                .font(.system(size: 20))
            
        }
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
    }
}
