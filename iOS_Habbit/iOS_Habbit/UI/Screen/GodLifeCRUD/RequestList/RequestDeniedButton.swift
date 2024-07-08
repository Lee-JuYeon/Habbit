//
//  RequestDeniedButton.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/3/24.
//

import SwiftUI

struct RequestDeniedButton: View {
    
    
    @Binding private var getDeniedReason : String
    @Binding private var getExpandableDenied : Bool
    private var getIndex : Int
    private var getList: [String]
    init(
        setDeniedReason: Binding<String>,
        setExpandableDenied: Binding<Bool>,
        setIndex: Int,
        setList: [String]
    ) {
        _getDeniedReason = setDeniedReason
        _getExpandableDenied = setExpandableDenied
        self.getIndex = setIndex
        self.getList = setList
    }
    
    private func deleteFromList(){
//        self.getList.remove(at: getIndex)
    }
    private func sendDeniedReason(){
        // 거절버튼 + 거절이유 해당 유저에게 송달'
        print("거절사유 : \(getDeniedReason)")

    }
    private func deniedSheetView() -> some View {
        return VStack(alignment: HorizontalAlignment.center, spacing: 0){
            TextField(
                "거절 사유를 작성해주세요. 거절 사유는 해당 신청자에게 전달됩니다",
                text: $getDeniedReason
            )
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            Text("보내기")
                .padding(5)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                )
                .padding(5)
                .onTapGesture {
                    getExpandableDenied.toggle()
                    sendDeniedReason()
                    deleteFromList()
                }
        }
    }
    
    var body: some View {
        Text("거절")
            .font(.system(size: 20, weight: .bold))
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.colourSheet)
            )
            .padding(5)
            .onTapGesture {
                getExpandableDenied.toggle()
            }
            .fullScreenCover(isPresented: $getExpandableDenied) {
                deniedSheetView()
            }
    }
}

