//
//  SafariView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/6/24.
//

//        getGodLifeViewType == .Create ? guideModel.title : getModel.title


import SwiftUI


struct GodLifeInfoView : View {
    
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
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading, spacing: 5){
            InfoTitleView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
            HStack(alignment : VerticalAlignment.center,spacing: 10){
                InfoImageView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
                VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    InfoTypeView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
                    InfoLocationView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
                    InfoPayView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
                }
            }
            InfoExplainView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
        }
    }
}
