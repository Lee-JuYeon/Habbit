//
//  SheetViews.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/4/24.
//

import SwiftUI

struct GodLifeDetail : View {
    
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

    var body: some View {
        VStack(alignment : HorizontalAlignment.center){
            HStack(alignment : VerticalAlignment.center){
                Image("image_back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        // 뒤로가기
                        screenVM.screenType = .MainView
                        screenVM.currentGodLifeModel = nil
                    }
                
                // 가입 버튼
                Text("가입 신청")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                    .padding(5)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .background(Color.colourSheet)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(5)
                    .onTapGesture {
                        // 신청버튼
                    }
               
            
                Image("image_danger")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        // 신고하기
                    }
            }//HStack
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(
                    alignment : HorizontalAlignment.center
                ) {
                    ScrollView(.horizontal, showsIndicators: false){
                        Text(screenVM.currentGodLifeModel?.title ?? "")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                    }

                    HStack(
                        alignment : VerticalAlignment.top
                    ){
                        // 취미 이미지
                        AsyncImage(
                            url: URL(string: screenVM.currentGodLifeModel?.image ?? "")
                        ) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                        } placeholder : {
                            ProgressView()
                                .frame(width: 150, height: 150)
                        }//AsyncImage
                        
                        VStack(
                            alignment:HorizontalAlignment.leading
                        ){
                            Text("📍 \(screenVM.currentGodLifeModel?.location ?? ["":""])")
                                .font(.system(size: 20))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("💵 \(monthlyPayConverter(pay: screenVM.currentGodLifeModel?.monthlyPay))")
                                .font(.system(size: 20))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text(screenVM.currentGodLifeModel?.explain ?? "")
                                .font(.system(size: 20))
                        }//VStack
                    }//HStaack
                   
                    // 호스트
                    HostView(setUserModel: UserModel.jiwonModel)
                    
                    // 리뷰 뷰
                    ReviewListView(setList: screenVM.currentGodLifeModel?.reviewList ?? [])
                    
                    // 활동 뷰
                    ActivityListView(setList: screenVM.currentGodLifeModel?.activityList ?? [] )
                    
                    // QnA
                    QnAView(setList: screenVM.currentGodLifeModel?.qna ?? [])
                    
                    // 공지사항
                }
            }
        }
        .padding(10)
        .background(Color.backgroundColour)
    }
}
