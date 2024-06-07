//
//  CustomBottomSheetVM.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

class CustomBottomSheetVM: ObservableObject {
    
    @Published var sheetType: CustomBottomSheetType = .AcademyCell
    @Published var sheetVisible : Bool = false
    @Published var academyModel : AcademyModel? = nil
    
}
