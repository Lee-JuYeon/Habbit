//
//  HostView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/10/24.
//

import SwiftUI

// name
// social media
// selfie + verify
// career
// bio

struct HostView: View {
    
    @Binding private var getUserModel : UserModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setUserModel: Binding<UserModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getUserModel = setUserModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    
    @State private var guideModel = GodLifeModel.guidModel

  
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            HStack(
                alignment : VerticalAlignment.center,
                spacing: 10
            ){
                
                HostNameView(setUserModel: $getUserModel, setGodLifeViewType: getGodLifeViewType)
                
                HostSocialView(setUserModel: getUserModel, setGodLifeViewType: getGodLifeViewType)
//                HostSocialView(
//                    setID: getUserModel.socialMedia["insta"],
//                    setSocialType: .INSTA
//                )
//                HostSocialView(
//                    setID: getUserModel.socialMedia["youtube"],
//                    setSocialType: .YOUTUBE
//                )
            }
            
            HStack(
                alignment : VerticalAlignment.top
            ){
    
                HostSelfieView(setUserModel: getUserModel, setGodLifeViewType: getGodLifeViewType)
                HostBioView(setUserModel: getUserModel, setGodLifeViewType: getGodLifeViewType)
            }
            
            HostCareerView(setUserModel: getUserModel, setGodLifeViewType: getGodLifeViewType)
           
            
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
}

