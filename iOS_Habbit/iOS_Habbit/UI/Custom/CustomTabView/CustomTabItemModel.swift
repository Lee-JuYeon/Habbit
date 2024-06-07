//
//  CustomTabView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct CustomTabItemModel : Hashable{
    let image: String
    let title: String
}

extension CustomTabItemModel {
    static var CustomTabItemModelList = [
        CustomTabItemModel(image: "icon_people", title: "Academy"),
        CustomTabItemModel(image: "icon_chat", title: "Chat"),
        CustomTabItemModel(image: "icon_profile", title: "Profile")
    ]
}

