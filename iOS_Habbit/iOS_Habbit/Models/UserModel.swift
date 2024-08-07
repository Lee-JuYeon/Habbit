//
//  UserModel.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI


struct UserModel : Hashable {
    let userUID : String
    let userName : String
    let selfieVerify : Bool
    let userImage : String
    let peerReview : [String] // 평판
    let socialMedia : [String:String] // insta, youtube
    let bio : String?
    let careers : [CareerModel]
}


extension UserModel {
    static let guidModel = UserModel(
        userUID: "유저UID",
        userName: "이름을 입력해주세요",
        selfieVerify: false,
        userImage: "",
        peerReview: [],
        socialMedia: ["":""],
        bio: "자기소개를 입력할 수 있습니다. 사진과 자기소개, 소셜미디어, 경력등은 갓생의 방장이 되는 경우에만 다른 사용자들에게 공개됩니다.",
        careers: []
    )
    static let jiwonModel = UserModel(
        userUID: "userUID1",
        userName: "김지원",
        selfieVerify: true,
        userImage: "https://img.etnews.com/news/article/2016/06/10/article_10075651203171.png",
        peerReview: [
            "정신없잉 이쁜 사람입니다",
            "드라마에서 보던 이미지와 달리 꽤나 적극적이며 활동적으로 갓생에 참여했습니다",
            "다른 갓생러들과 잘 교류하며 해당 갓생을 보다 활기찬 분위기로 이끌어가는데 일조하여 많은 도움이 되는 멤버였습니다.",
            "처음들어와 적응하기 힘든 신입 갓생러들을 친절한 태도로 대해주어 신입갓생러들이 해당 갓생에 잘 적응하게 도와주어 굉장히 핵심적인 멤버입니다."
        ],
        socialMedia: [
            "insta" : "geewonii"
        ],
        bio: "딕션이 좋은 배우 하면 떠오르는 인물로 항상 꼽힐 정도로 정확한 발음과 깔끔한 대사 전달력으로 유명하다. 영상 특히 《상속자들》 이후부터 군더더기 없는 발성과 발음으로 주목 받았다. 그런데 이러한 평가에 대해서 발음과 더불어 좋은 감정을 전달할 수 있는 연기자가 되어야겠다는 생각을 많이 한다는 소신을 밝히기도 했다.",
        careers: CareerModel.dummyList
    )
    
    static let saeKyeongModel = UserModel(
        userUID: "userUID2",
        userName: "신세경",
        selfieVerify: false,
        userImage: "https://i.namu.wiki/i/0gqiqHAg2L7HJMcGERRDzMjRZVMY1W9zrITA1Qgi016whYGxSQN2HNJvXPj6-FB4GeBcU-jo8KVISs_nsse32Yf8O3wXJSbRALGOj8T2P6THbr8huzNqCKZxXuwNsatfh3i11K6IxNc-UNofyFpycg.webp",
        peerReview: [
            "userUID1"
        ],
        socialMedia: [
            "insta" : "sjkuksee",
            "youtube" : "@sjkuksee"
        ],
        bio: "'세경(世炅)'이라는 이름은 큰아버지가 지어주신 이름으로, '세상의 빛'이라는 뜻이다. 초등학교 5학년 때 현재 키로 자라서, 항상 친구들보다 머리 하나가 더 있었다고 한다. 몸뿐만 아니라 마음도 일찌감치 자랐다는 이 소녀는, 아버지가 꽁치를 발라주시는 모습에 눈물을 흘리고, 초등학교 1학년 때 김동률의 음악을 들으면서 눈물 지었다고 고백하기도 했다. 본인 말로는 이 시기에 사춘기가 찾아왔다고 한다.",
        careers: CareerModel.dummyList
    )
}
