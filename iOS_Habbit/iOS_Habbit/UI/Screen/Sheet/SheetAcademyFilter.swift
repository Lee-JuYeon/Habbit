//
//  SheetAcademyFilter.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/4/24.
//

import SwiftUI
import MapKit

struct SheetAcademyFilter: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.5666791, 
            longitude: 126.9782914
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )

    
    var body: some View {
        VStack {
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
                
                //map
                mapView()
                
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
    
    private func mapView() -> some View {
        return Map(
            coordinateRegion: $region,
            showsUserLocation: true,
            userTrackingMode: .constant(.follow)
        )
        .frame(
            width: 200,
            height: 200
        )
    }
}

