//
//  CustomBottomSheetVM.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

struct InfoPayView: View {
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    private func monthlyPayConverter(pay: Double?) -> String {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency // Use currency number style
      formatter.locale = Locale(identifier: "ko_KR")

      if let pay = pay {
        if pay == 0.0 {
          return "무료"
        } else if let formattedPay = formatter.string(from: NSNumber(value: pay)) {
          // Remove the leading currency symbol (원) and add a trailing "원"
          let trimmedAndAppendedPay = formattedPay.replacingOccurrences(of: "₩", with: "") + "원"
          return trimmedAndAppendedPay
        }
      }
      return "무료"
    }
    
    @State private var guideModel = GodLifeModel.guidModel
    @State private var isOpenPrice = false
    @State private var payText = ""
    private func uploadUpdateMonthlyPay(){
        payText = ""
    }
    
    
    var body: some View {
        Text("💵 : \(payText)")
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .onAppear(perform: {
                switch(getGodLifeViewType){
                case .Create :
                    payText = "클릭하여 월 요금 작성"
                case .Update :
                    payText = monthlyPayConverter(pay: getModel.monthlyPay)
                case .Joined, .Read :
                    payText = monthlyPayConverter(pay: getModel.monthlyPay)
                }
            })
            .onTapGesture {
                switch(getGodLifeViewType){
                case .Create :
                    isOpenPrice.toggle()
                case .Update :
                    isOpenPrice.toggle()
                case .Joined, .Read :
                    print("")
                }
            }
            .fullScreenCover(isPresented: $isOpenPrice) {
                Text("uploadUpdateMonthlyPay()를 이용해 업로드")
                    .onTapGesture {
                        isOpenPrice.toggle()
                    }
            }
    }
}
