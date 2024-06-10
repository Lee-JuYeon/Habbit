//
//  ReviewModel.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

struct ReviewModel : Hashable {
    let reviewUID : String
    let user : UserModel
    let reviews : String
    let image : String?
    let stars : Double
}
