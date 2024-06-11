//
//  AcademyCell.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

struct GodLifeCell : View {
    
    private var getModel : GodLifeModel? = nil
    private var onClick : (GodLifeModel) -> ()
    init(
        setModel : GodLifeModel,
        onClick : @escaping (GodLifeModel) -> ()
    ){
        self.getModel = setModel
        self.onClick = onClick
    }
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
    @EnvironmentObject private var screenVM : ScreenVM
    
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

    var body : some View {
        HStack(
            alignment: .top
        ){
            // 네트워크 이미지
            AsyncImage(
                url: URL(string: getModel?.image ?? "")
            ) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } placeholder : {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            
            LazyVStack(alignment : HorizontalAlignment.leading){
                Text(getModel?.title ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(getModel?.type ?? "")
                    .font(.title3)
                Text("📍 \(String(describing: getModel?.location ?? ""))")
                    .font(.title3)
                Text("💵 \(monthlyPayConverter(pay: getModel?.monthlyPay))")
            }
        }
        .onTapGesture {
//            withAnimation {
//                bottomSheetVM.academyModel = getModel
//                bottomSheetVM.sheetType = .AcademyCell
//                bottomSheetVM.sheetVisible.toggle()
//            }
            onClick(getModel!)
        }
        .frame(maxHeight: 150)
        .swipeActions(edge: .trailing){
            Button(action: {
                // 저장 액션 수행
                print("Save tapped for ")
            }) {
                Label("Save", systemImage: "square.and.arrow.down")
            }
        }
        .swipeActions(edge: .trailing){
            Button(action: {
                // 신고 액션 수행
                print("신고 tapped for ")
            }) {
                Label("신고", systemImage: "square.and.arrow.down")
            }
        }
        .padding(
            EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        )
    }
}
