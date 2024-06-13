//
//  SheetAcademyFilter.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/4/24.
//

import SwiftUI

struct SheetAcademyFilter: View {


    
    var body: some View {
        VStack(alignment : HorizontalAlignment.center) {
            Text("조건 검색")
                .font(.system(size: 20))
                .fontWeight(.bold)
            /* 필터링 요소
             이미지
             모임 타이틀
             모임 위치
             모임 가격
             리뷰 리스트
             좋아요, 신고 버튼
             타입,
             관리자 체크
             호스트 : 인증받은 호스트
             */
            HStack(alignment : VerticalAlignment.center){
                Text("위치")
                
                
                
            }
           
            DropDownView(setTitle: "가격", setList: ["무료", "유료"]) { price in
                // price
            }
           
            DropDownView(setTitle: "타입", setList: ["IT", "요리", "필라테스"]) { type in
                // type
            }
            
            Text("후기순")
            
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity
        )
    }
    
   
}

