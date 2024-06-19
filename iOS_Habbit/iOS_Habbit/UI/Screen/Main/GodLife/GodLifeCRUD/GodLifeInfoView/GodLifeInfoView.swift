//
//  SafariView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/6/24.
//

import SwiftUI

struct GodLifeInfoView : View {
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    private func monthlyPayConverter(pay : Double?) -> String {
        return switch(pay){
        case 0.0 :
            "무료"
        case nil :
            "무료"
        default :
            String(format: "%.0f", pay ?? "무료") + "원"
        }
    }

    @State private var isOpenTitle = false
    @State private var titleValue = ""
    private func titleEditView() -> some View {
        return VStack(){
            Text("갓생 제목 수정")
                .font(.system(size: 30, weight: Font.Weight.bold))

            TextField(
                getModel.title,
                text: $titleValue
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("저장")
                .font(.system(size: 20, weight: Font.Weight.light))
                .onTapGesture {
                    isOpenTitle.toggle()
                }
        }
        .maxFrameSize()
    }
    
    @State private var isOpenLocation = false
    private func editLocationView() -> some View {
        return VStack{
            
        }
        .maxFrameSize()
    }
    @State private var isOpenMonthPay = false
    @State private var isOpenExplain = false
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false){
                Text(getModel.title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .onTapGesture {
                        if getGodLifeViewType == .Update {
                            isOpenTitle.toggle()
                        }
                    }
                    .bottomSheet(isOpen: $isOpenTitle) {
                        titleEditView()
                    }
            }

            HStack(
                alignment : VerticalAlignment.top
            ){
                // 취미 이미지
                AsyncImage(
                    url: URL(string: getModel.image ?? "")
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                } placeholder : {
                    VStack(alignment : HorizontalAlignment.center, spacing: 15.0){
                        Text("클릭하여 사진을 추가해주세요")
                        ProgressView()
                            
                    }
                    .frame(
                        width: 150,
                        height: 150
                    )
                }
                .background(
                    Rectangle().stroke(.black, lineWidth: 1.0)
                )
                
                VStack(
                    alignment:HorizontalAlignment.leading
                ){
                    Text("📍 \(getModel.location)")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            if getGodLifeViewType == .Update {
                                isOpenLocation.toggle()
                            }
                        }
                        .bottomSheet(isOpen: $isOpenLocation) {
                            Text("")
                        }
                    
                    Text("💵 \(monthlyPayConverter(pay: getModel.monthlyPay))")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            if getGodLifeViewType == .Update {
                                isOpenMonthPay.toggle()
                            }
                        }
                        .bottomSheet(isOpen: $isOpenMonthPay) {
                            Text("")
                        }
                    
                    Text(getModel.explain)
                        .font(.system(size: 20))
                        .onTapGesture {
                            if getGodLifeViewType == .Update {
                                isOpenExplain.toggle()
                            }
                        }
                        .bottomSheet(isOpen: $isOpenExplain) {
                            Text("")
                        }
                    
                }//VStack
            }//HStaack
        }
    }
}
