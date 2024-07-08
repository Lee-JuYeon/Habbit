//
//  RequestAcceptButton.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/3/24.
//

import SwiftUI

struct RequestAcceptButton: View {
    
    private var getIndex : Int
    private var getList: [String]
    init(
        setIndex: Int,
        setList: [String]
    ) {
        self.getIndex = setIndex
        self.getList = setList
    }
    
    // 멤버에 평민으로 추가
    private func addMemeber(){
        
    }
    
    // 해당 요청, 리퀘스트 리스트에서 사라지게
    private func removeRequestFromList(){
        
    }
    
    var body: some View {
        Text("승인")
            .font(.system(size: 20, weight: .bold))
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.colourSheet)
            )
            .padding(5)
            .onTapGesture {
                removeRequestFromList()
                addMemeber()
            }
    }
}
