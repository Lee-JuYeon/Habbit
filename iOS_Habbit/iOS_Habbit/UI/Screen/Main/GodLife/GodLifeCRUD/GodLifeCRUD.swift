//
//  SheetViews.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/4/24.
//

import SwiftUI

struct GodLifeCRUD : View {
    
    @Binding private var getVisibleView : Bool
    @Binding private var getModel: GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setVisibleView : Binding<Bool>,
        setGodLifeModel : Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ){
        self._getVisibleView = setVisibleView
        self._getModel = setGodLifeModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    

    
   
    var body: some View {
        VStack(alignment : HorizontalAlignment.center){
            GodLifeTopView(
                setVisibleView: $getVisibleView,
                setGodLifeViewType: getGodLifeViewType,
                setDeleteGodLife: {
                    
                },
                setJoinGodLife: {
                    
                },
                setReportGodLife: { reportString in
                    
                }
             )
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(
                    alignment : HorizontalAlignment.center
                ) {
                    GodLifeInfoView(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
                   
                    // 호스트
                    HostView(setUserModel: UserModel.jiwonModel)
                    
                    // 리뷰 뷰
//                    if let reviewList = getModel.reviewList {
//                        ReviewListView(setList: reviewList)
//                    }
                    
                    // 활동 뷰
//                    if let activityList = getModel.activityList {
//                        ActivityListView(setList: activityList)
//                    }
                    
                    // QnA
//                    if let qnaList = getModel.qna {
//                        QnAView(setList: qnaList)
//                    }
                    
                    // 공지사항
//                    if let notificationList = getModel?.notice {
//                        NotificationView(notificationList: notificationList)
//                    }
                }
            }
        }
        .padding(10)
        .background(Color.backgroundColour)
    }
}
