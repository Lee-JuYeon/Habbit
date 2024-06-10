//
//  SheetViews.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/4/24.
//

import SwiftUI

struct SheetAcademyCell: View {
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack(
                alignment : HorizontalAlignment.leading
            ) {
                HStack(alignment : VerticalAlignment.center){
                    Image("image_star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            // 신고버튼
                        }
                    Text(bottomSheetVM.academyModel?.title ?? "")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }//HStack

                HStack(
                    alignment : VerticalAlignment.top
                ){
                    // 취미 이미지
                    AsyncImage(
                        url: URL(string: bottomSheetVM.academyModel?.image ?? "")
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
                        Text("📍 \(bottomSheetVM.academyModel?.location ?? "")")
                            .font(.system(size: 20))
                        Text("💵 \(bottomSheetVM.academyModel?.monthlyPay ?? 0)")
                            .font(.system(size: 20))
                        Text(bottomSheetVM.academyModel?.explain ?? "")
                            .font(.system(size: 20))
                    }//VStack
                }//HStaack
               
                // 호스트
                HostView(setUserModel: UserModel.jiwonModel)
                
                // 리뷰 뷰
                ReviewListView(setList: AcademyModel.dummyList.first?.reviewList ?? [])
                
                // 활동 뷰
                ActivityListView(setList: AcademyModel.dummyList.first?.activityList ?? [] )
                
            }
        }
        .padding(10)
    }
}
