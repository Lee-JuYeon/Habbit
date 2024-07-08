//
//  InfoLocationView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/25/24.
//

import SwiftUI

struct InfoLocationView: View {
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    @State private var guideModel = GodLifeModel.guidModel
    @State private var isOpenLocation = false
    @State private var locationText = ""
    private func uploadUpdateLocation(){
       
        locationText = ""  // 마지막 nil처리
    }

    var body: some View {
        Text("📍 주소 : \(locationText)")
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .onAppear(perform: {
                switch(getGodLifeViewType){
                case .Create :
                    locationText = "클릭하여 주소변경"
                case .Update :
                    locationText = getModel.location.isEmpty ? "" : "\(getModel.location)"
                case .Joined, .Read :
                    locationText = "\(getModel.location)"
                }
            })
            .onTapGesture {
                switch(getGodLifeViewType){
                case .Create :
                    isOpenLocation.toggle()
                case .Update :
                    isOpenLocation.toggle()
                case .Joined, .Read :
                    print("")
                }
            }
            .fullScreenCover(isPresented: $isOpenLocation) {
                Text("uploadUpdateLocation()를 이용해 업로드, 주소 팝업도 열어야함.")
                    .onTapGesture {
                        isOpenLocation.toggle()
                    }
            }
    }
}
