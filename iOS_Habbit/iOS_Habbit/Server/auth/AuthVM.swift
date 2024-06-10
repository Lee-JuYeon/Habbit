//
//  AuthVM.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/8/24.
//

import SwiftUI

class AuthVM: ObservableObject {
    
    @Published var user: UserModel? = nil
    
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var name : String = ""
    @Published var selfie : String = ""
    @Published var bio : String = ""
    @Published var careers : [CareerModel] = []
    
}

