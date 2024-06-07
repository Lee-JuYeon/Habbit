//
//  CareerModel.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI


struct CareerModel : Hashable {
    var titie : String
    var career : String
}

extension CareerModel {
    static let dummyList : [CareerModel] = [
        CareerModel(titie: "커리어제목1", career: "커리어ㅓ 내용1111111111111"),
        CareerModel(titie: "커리어제목2", career: "커리어ㅓ 내용2"),
        CareerModel(titie: "커리어제목3", career: "커리어ㅓ 내용3"),
        CareerModel(titie: "커리어제목4", career: "커리어ㅓ 내용4"),
        CareerModel(titie: "커리어제목5", career: "커리어ㅓ 내용5"),
        CareerModel(titie: "커리어제목6", career: "커리어ㅓ 내용6"),
        CareerModel(titie: "커리어제목7", career: "커리어ㅓ 내용7"),
        CareerModel(titie: "커리어제목8", career: "커리어ㅓ 내용8")
    ]
}
