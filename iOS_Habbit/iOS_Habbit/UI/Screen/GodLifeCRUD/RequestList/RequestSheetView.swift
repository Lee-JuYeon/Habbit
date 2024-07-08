//
//  RequestSheetView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/3/24.
//

import SwiftUI

struct RequestSheetView: View {
    
    private var getList: [String]
    init(
        setList: [String]
    ) {
        self.getList = setList
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    ForEach(getList.indices, id: \.self) { index in
                        RequestItemView(
                            setUserUID: getList[index],
                            setIndex : index,
                            setList: getList
                        )
                            .id(UUID()) // 각 항목에 고유한 ID 부여
                    }
                }
            }
        }
    }
}
