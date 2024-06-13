//
//  AcademyHeader.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI
import MapKit


struct AppleMap : View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.5666791, // 서울 위치
            longitude: 126.9782914 // 서울 위치
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
        )
    )
    
    var body: some View {
        mapView()
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
