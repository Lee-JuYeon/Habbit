//
//  AcademyModel.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

struct GodLifeModel : Hashable {
    let godLifeUID : String
    let hostUID : String?
    let image : String?
    let title : String
    let location : String
    let monthlyPay : Double?
    let explain : String
    let reviewList : [ReviewModel]?
    let likeList : [String]? // user uid list
    let type : String? 
    let adminChecked : Bool
    let activityList : [ActivityModel]
    let members : [MembersModel] 
    let userRequest : [String]
    let qna : [QnAModel]
    let notice : [GodLifeNotification]
}




extension GodLifeModel {
    static let dummyList : [GodLifeModel] = [
        // Academy 1
        GodLifeModel(
            godLifeUID: "academy-1",
            hostUID: "host-1",
            image: "https://newsimg.sedaily.com/2023/11/08/29X5NVRFTF_1.jpg",
            title: "Python 프로그래밍 입문",
            location: "서울 강남구",
            monthlyPay: 0,
            explain: "초보자를 위한 Python 프로그래밍 입문 모임입니다. 기본적인 문법부터 실습까지 배우고, 간단한 프로그램을 만들어 보세요.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-1",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "매우 재미있고 유익한 모임이었습니다. 선생님도 친절하고, 다른 참가자들과도 좋은 시간을 보냈습니다.",
                    image: "https://newsimg.sedaily.com/2023/11/08/29X5NVRFTF_1.jpg",
                    stars: 0.0
                ),
                ReviewModel(
                    reviewUID: "review-1",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "정말 효과적으로 수영 실력을 향상시킬 수 있었습니다. 코치님의 지도도 훌륭하고, 다른 참가자들과 함께 즐겁게 운동했습니다.",
                    image: "https://pds.skyedaily.com/news_data2019/20201214123511_fbycyzdb.jpg",
                    stars: 5.0
                    
                ),
                ReviewModel(
                    reviewUID: "review-3",
                    user: UserModel(
                        userUID: "user-3",
                        userName: "Charlie",
                        selfieVerify: true,
                        userImage: "user_image_3",
                        peerReview: ["Excellent communication skills."],
                        socialMedia: ["youtube": "charlie_yt"],
                        bio: "Enjoys learning new languages and cultures.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "영어 회화 실력이 정말 많이 향상되었습니다. 강사님도 친절하고, 다른 참가자들과 함께 즐겁게 공부했습니다.",
                    image: "https://newsimg.sedaily.com/2023/05/13/29PKA7UGR6_1.jpg",
                    stars: 3.2
                ),
                ReviewModel(
                    reviewUID: "review-4",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "다양한 요리를 배우고, 직접 만들어 먹는 재미가 정말 좋았습니다. 선생님의 설명도 명확하고, 다른 참가자들과 함께 맛있는 식사를 했습니다.",
                    image: "https://isplus.com/data/isp/image/2023/07/11/isp20230711000249.600x.8.jpg",
                    stars: 2.0
                )
            ],
            likeList: ["user-2", "user-3"],
            type: "IT",
            adminChecked: true,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        ),

        // Academy 2
        GodLifeModel(
            academyUID: "academy-2",
            hostUID: "host-2",
            image: "https://pds.skyedaily.com/news_data2019/20201214123511_fbycyzdb.jpg",
            title: "수영 실력 향상",
            location: "인천 연수구",
            monthlyPay: nil,
            explain: "수영 실력을 향상시키고 싶은 분들을 위한 모임입니다. 기본적인 자세와 스트로크부터 훈련까지, 전문 코치가 직접 지도해 드립니다.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-1",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "매우 재미있고 유익한 모임이었습니다. 선생님도 친절하고, 다른 참가자들과도 좋은 시간을 보냈습니다.",
                    image: "https://newsimg.sedaily.com/2023/11/08/29X5NVRFTF_1.jpg",
                    stars: 1.0
                ),
                ReviewModel(
                    reviewUID: "review-1",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "정말 효과적으로 수영 실력을 향상시킬 수 있었습니다. 코치님의 지도도 훌륭하고, 다른 참가자들과 함께 즐겁게 운동했습니다.",
                    image: "https://pds.skyedaily.com/news_data2019/20201214123511_fbycyzdb.jpg",
                    stars: 2.0
                ),
                ReviewModel(
                    reviewUID: "review-3",
                    user: UserModel(
                        userUID: "user-3",
                        userName: "Charlie",
                        selfieVerify: true,
                        userImage: "user_image_3",
                        peerReview: ["Excellent communication skills."],
                        socialMedia: ["youtube": "charlie_yt"],
                        bio: "Enjoys learning new languages and cultures.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "영어 회화 실력이 정말 많이 향상되었습니다. 강사님도 친절하고, 다른 참가자들과 함께 즐겁게 공부했습니다.",
                    image: "https://newsimg.sedaily.com/2023/05/13/29PKA7UGR6_1.jpg",
                    stars: 3.5
                ),
                ReviewModel(
                    reviewUID: "review-4",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "다양한 요리를 배우고, 직접 만들어 먹는 재미가 정말 좋았습니다. 선생님의 설명도 명확하고, 다른 참가자들과 함께 맛있는 식사를 했습니다.",
                    image: "https://isplus.com/data/isp/image/2023/07/11/isp20230711000249.600x.8.jpg",
                    stars: 4.0
                )
            ],
            likeList: ["user-4", "user-5"],
            type: "운동",
            adminChecked: false,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        ),

        // Academy 3
        GodLifeModel(
            academyUID: "academy-3",
            hostUID: "host-3",
            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
            title: "영어 회화 실력 향상",
            location: "대구 중구",
            monthlyPay: 200000,
            explain: "영어 회화 실력을 향상시키고 싶은 분들을 위한 모임입니다. 외국인 강사와 함께 자연스럽게 영어 대화를 연습하고, 실생활에서 유용한 표현을 배우세요.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-1",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "매우 재미있고 유익한 모임이었습니다. 선생님도 친절하고, 다른 참가자들과도 좋은 시간을 보냈습니다.",
                    image: "https://newsimg.sedaily.com/2023/11/08/29X5NVRFTF_1.jpg",
                    stars: 3.5
                ),
                ReviewModel(
                    reviewUID: "review-1",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "정말 효과적으로 수영 실력을 향상시킬 수 있었습니다. 코치님의 지도도 훌륭하고, 다른 참가자들과 함께 즐겁게 운동했습니다.",
                    image: "https://pds.skyedaily.com/news_data2019/20201214123511_fbycyzdb.jpg",
                    stars: 3.5
                ),
                ReviewModel(
                    reviewUID: "review-3",
                    user: UserModel(
                        userUID: "user-3",
                        userName: "Charlie",
                        selfieVerify: true,
                        userImage: "user_image_3",
                        peerReview: ["Excellent communication skills."],
                        socialMedia: ["youtube": "charlie_yt"],
                        bio: "Enjoys learning new languages and cultures.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "영어 회화 실력이 정말 많이 향상되었습니다. 강사님도 친절하고, 다른 참가자들과 함께 즐겁게 공부했습니다.",
                    image: "https://newsimg.sedaily.com/2023/05/13/29PKA7UGR6_1.jpg",
                    stars: 3.5
                ),
                ReviewModel(
                    reviewUID: "review-4",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "다양한 요리를 배우고, 직접 만들어 먹는 재미가 정말 좋았습니다. 선생님의 설명도 명확하고, 다른 참가자들과 함께 맛있는 식사를 했습니다.",
                    image: "https://isplus.com/data/isp/image/2023/07/11/isp20230711000249.600x.8.jpg",
                    stars: 3.5
                )
            ],
            likeList: ["user-6", "user-7", "user-8"],
            type: "외국어",
            adminChecked: true,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        ),

        // Academy 4
        GodLifeModel(
            academyUID: "academy-4",
            hostUID: "host-4",
            image: "academy_image_4",
            title: "요리 배우기",
            location: "광주 서구",
            monthlyPay: 120000,
            explain: "집에서 맛있는 요리를 만들 수 있도록 다양한 요리 레시피를 배우는 모임입니다. 직접 만들어 먹는 재미를 느껴보세요.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-4",
                    user: UserModel(
                        userUID: "user-1",
                        userName: "Alice",
                        selfieVerify: true,
                        userImage: "user_image_1",
                        peerReview: ["Great person to work with!"],
                        socialMedia: ["instagram": "alice_insta", "youtube": "alice_yt"],
                        bio: "Passionate about technology and education.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "다양한 요리를 배우고, 직접 만들어 먹는 재미가 정말 좋았습니다. 선생님의 설명도 명확하고, 다른 참가자들과 함께 맛있는 식사를 했습니다.",
                    image: "user_image_4",
                    stars: 3.5
                )
            ],
            likeList: ["user-9", "user-10"],
            type: "요리",
            adminChecked: false,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        ),

        // Academy 5
        GodLifeModel(
            academyUID: "academy-5",
            hostUID: "host-5",
            image: "academy_image_5",
            title: "사진 촬영 기초",
            location: "부산 해운대구",
            monthlyPay: 180000,
            explain: "사진 촬영 기초를 배우고 싶은 분들을 위한 모임입니다. 기본적인 카메라 설정부터 촬영 기술까지 배워보세요.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-5",
                    user: UserModel(
                        userUID: "user-2",
                        userName: "Bob",
                        selfieVerify: false,
                        userImage: "user_image_2",
                        peerReview: ["Very punctual and reliable."],
                        socialMedia: ["instagram": "bob_insta"],
                        bio: "Love swimming and outdoor activities.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "기초부터 체계적으로 배울 수 있어서 좋았습니다. 강사님도 친절하시고, 촬영 실력이 많이 늘었습니다.",
                    image: "user_image_5",
                    stars: 3.5
                )
            ],
            likeList: ["user-11", "user-12"],
            type: "사진",
            adminChecked: true,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        ),

        // Academy 6
        GodLifeModel(
            academyUID: "academy-6",
            hostUID: "host-6",
            image: "academy_image_6",
            title: "피아노 레슨",
            location: "서울 마포구",
            monthlyPay: 220000,
            explain: "피아노를 처음 배우거나 실력을 향상시키고 싶은 분들을 위한 모임입니다. 개인 맞춤형 레슨을 통해 피아노 실력을 향상시켜보세요.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-6",
                    user: UserModel(
                        userUID: "user-3",
                        userName: "Charlie",
                        selfieVerify: true,
                        userImage: "user_image_3",
                        peerReview: ["Excellent communication skills."],
                        socialMedia: ["youtube": "charlie_yt"],
                        bio: "Enjoys learning new languages and cultures.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "개인 맞춤형 레슨이 정말 좋았습니다. 피아노 실력이 많이 향상되었고, 강사님도 매우 친절하십니다.",
                    image: "user_image_6",
                    stars: 3.5
                )
            ],
            likeList: ["user-13", "user-14"],
            type: "음악",
            adminChecked: false,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        ),

        // Academy 7
        GodLifeModel(
            academyUID: "academy-7",
            hostUID: "host-7",
            image: "academy_image_7",
            title: "드로잉 클래스",
            location: "서울 용산구",
            monthlyPay: 200000,
            explain: "드로잉 기초부터 고급 기술까지 배울 수 있는 모임입니다. 창의력을 키우고 싶은 분들에게 추천합니다.",
            reviewList: [
                ReviewModel(
                    reviewUID: "review-7",
                    user: UserModel(
                        userUID: "user-3",
                        userName: "Charlie",
                        selfieVerify: true,
                        userImage: "user_image_3",
                        peerReview: ["Excellent communication skills."],
                        socialMedia: ["youtube": "charlie_yt"],
                        bio: "Enjoys learning new languages and cultures.",
                        careers: CareerModel.dummyList
                    ),
                    reviews: "개인 맞춤형 레슨이 정말 좋았습니다. 피아노 실력이 많이 향상되었고, 강사님도 매우 친절하십니다.",
                    image: "user_image_6",
                    stars: 3.5
                )
            ],
            likeList: ["user-13", "user-14"],
            type: "음악",
            adminChecked: false,
            activityList: [
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjM2/MDAxNjQ5NjQ1NTUzMzI5.vpeEEJJTn0NpRNpWrZ7fdioOal5H3wrD44m3pDBU6jMg.hOp84lNnG3L210FOAoobEiuSy-iRT3-rJ44GvPraYeIg.JPEG.choiyou1841/149c69b82bd01a8761a646f6d4ee3676.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://postfiles.pstatic.net/MjAyMjA0MTFfMjI5/MDAxNjQ5NjQ1NTQ5MjEy.ZLgb-5EzEzirkYle4tGbnxYiDvu2cF_bFmBfp-nqUbsg.N8noPnxmoShQx9wXRQH-k89StTqxdySSOqElavXh4Ssg.JPEG.choiyou1841/808c131b5a04fad14b36b6350b2c207e.jpg?type=w966",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
                ActivityModel(
                    academyUID: "activitymodel-uid",
                    images: [
                        ActivityImageModel(
                            imageUID: "imageuid",
                            academyUID: "academyuid",
                            uploadedUserUID: "useruid",
                            image: "https://pbs.twimg.com/media/FGkn0HiVEAMAs-8?format=jpg&name=large",
                            date: "2022.02.02"
                        )
                    ],
                    date: "2022.02.02"
                ),
            ]
        )
    ]
   
}
