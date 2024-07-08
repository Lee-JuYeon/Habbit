//
//  ActivityListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/10/24.
//

import SwiftUI

struct ActivityListView: View {
    
    let setList : [ActivityModel]
    let setGodLifeViewType : GodLifeViewType
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                Text("활동내역")
                    .font(.system(size: 30, weight: .bold))
                
                ActivityAddButton(setGodLifeViewType: setGodLifeViewType)
            }
           
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment : VerticalAlignment.top){
                    ForEach(setList, id: \.self){ model in
                        // 리뷰 리스트 아이탬
                        ActivityItem(setModel: model)
                    }// ForEach
                }// LazyHStack
            }//Scrollview
        }//VStack
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
 
}
