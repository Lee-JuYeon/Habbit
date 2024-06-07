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
        LazyVStack(
            alignment : HorizontalAlignment.leading
        ) {
            Text("갓생 추가하기")
                .font(.largeTitle)
                .fontWeight(.bold)
                

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
                }
                /*
                  신고 버튼
                 타입,
                 관리자 체크
                 */
                VStack(
                    alignment:HorizontalAlignment.leading
                ){
                    Text(bottomSheetVM.academyModel?.title ?? "")
                    Text("📍 \(bottomSheetVM.academyModel?.location ?? "")")
                    Text("💵 \(bottomSheetVM.academyModel?.monthlyPay ?? 0)")
                    Spacer()
                    Text(bottomSheetVM.academyModel?.explain ?? "")
                }
            }
           
            HStack(
                alignment:VerticalAlignment.top
            ){
                // 호스트 이미지
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
                }
                
                // 바이오, 소셜미디어
                VStack(
                    alignment:HorizontalAlignment.leading
                ){
                    Text("Bio")
                    Text("소셜미디어")
                }
            }
            
            LazyHStack(){
                //좋아요 버튼
                Image(systemName: "questionmark.diamond")
                
                ForEach(bottomSheetVM.academyModel?.likeList ?? [], id: \.self){ userUID in
                    // 좋아요 한 사람들 리스트
                    Text("좋아요 이미지")
                }
            }
            
            ForEach(bottomSheetVM.academyModel?.reviewList ?? [], id: \.self){ i in
                // 리뷰 리스트
                Text("리뷰 카드")
            }
        }
        .padding(10)
        .frame(
            minWidth: 0,
            maxWidth: .infinity
        )
    }
}
