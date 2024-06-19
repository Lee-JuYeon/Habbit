//
//  ManageGodLifeCell.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/14/24.
//

import SwiftUI

struct CreatedGodLifeView : View {
    
    @State private var isOpen : Bool = false
    private var getModel : GodLifeModel = GodLifeModel.dummyList.first!

    
//    @Binding private var isOpen : Bool
//    private var getModel : GodLifeModel? = nil
//    init(
//        setModel : GodLifeModel,
//        setVisible : Binding<Bool>
//    ){
//        self.getModel = setModel
//        self._isOpen = setVisible
//    }
        
    private func monthlyPayConverter(pay : Double?) -> String {
        return switch(pay){
        case 0.0 :
            "무료"
        case nil :
            "무료"
        default :
            String(format: "%.0f", pay ?? "무료") + "원"
        }
    }

    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
           
        }
        .padding(10)
        .background(Color.backgroundColour)
    }
    
   
    
}
