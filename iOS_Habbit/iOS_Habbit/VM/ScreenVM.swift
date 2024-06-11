//
//  ScreenVM.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/11/24.
//

import SwiftUI

enum ScreenType {
    case MainView
    case GodLife
    case Manage
    case Profile
    case GodLife_Detail
    case GodLife_Make
}

class ScreenVM: ObservableObject {
    
    @Published var screenType: ScreenType = .MainView
    @Published var currentGodLifeModel : GodLifeModel? = nil
    @Published var pageIndex : Int = 0
    
}


