//
//  RequestListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/1/24.
//

import SwiftUI

struct RequestListView: View {
    
    private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel : GodLifeModel,
        setGodLifeViewType : GodLifeViewType
    ) {
        self.getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    @State private var requestSheetOpen = false
    var body: some View {
        if getGodLifeViewType == .Update && getModel.userRequest.count != 0{
//            Text("가입요청이 \(getModel.userRequest.count)개가 들어왔습니다.")
            Text("가입요청 : \(getModel.userRequest.count)")
                .font(.system(size: 20, weight: .bold))
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                )
                .padding(5)
                .onTapGesture {
                    requestSheetOpen.toggle()
                }
                .bottomSheet(isOpen: $requestSheetOpen, setContent: {
                    RequestSheetView(setList: getModel.userRequest)
                })
        }
    }
}
