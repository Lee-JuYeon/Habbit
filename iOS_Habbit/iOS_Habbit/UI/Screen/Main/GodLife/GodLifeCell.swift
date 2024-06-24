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
    private var getCellType : CellType = .Main
    init(
        setModel : GodLifeModel,
        setCellType : CellType,
        onClick : @escaping (GodLifeModel) -> ()
    ){
        self.getModel = setModel
        self.getCellType = setCellType
        self.onClick = onClick
    }
    
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
    
    enum CellType {
        case Main
        case Update
        case Joined
    }

    var body : some View {
        ZStack{
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
                    Text("📍 \(String(describing: getModel?.location ?? ["":0.0]))")
                        .font(.title3)
                    Text("💵 \(monthlyPayConverter(pay: getModel?.monthlyPay))")
                    
                
                    if getModel?.userRequest.count ?? 0 > 0 && getCellType == .Update {
                        Text("가입 요청 \(getModel?.userRequest.count ?? 0)건")
                            .font(.title3)
                            .padding(5)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(5)

                    }
                }
            }
            .overlay {
                if getModel?.adminChecked == false && getCellType == .Update{
                    ZStack(alignment : .center){
                        Color.gray.opacity(0.8)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity
                            )
                        
                        Text("개설 승낙을 기다리는 중입니다...")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .onTapGesture {
            if getModel?.adminChecked == true{
                onClick(getModel!)
            }
        }
        .frame(maxHeight: 150)
        .padding(
            EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        )
    }
}
