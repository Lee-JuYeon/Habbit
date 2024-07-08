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
    

    
    @State private var dummyUserModel = UserModel.saeKyeongModel
    var body: some View {
        VStack(alignment : HorizontalAlignment.center){
            GodLifeTopView(
                setVisibleView: $getVisibleView,
                setGodLifeViewType: getGodLifeViewType,
                setGodLifeModel: getModel,
                setHostExitGodLife: {
                    
                }, 
                setMemberExitGodLife: {
                    
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
                    HostView(setUserModel: $dummyUserModel, setGodLifeViewType: getGodLifeViewType)
                    
                    // 후기 review list
                    HostReviewList(setModel: $getModel, setGodLifeViewType: getGodLifeViewType)
                    
                    // 좋아요 리스트 like List
                    // 멤버 리스트 member list
                    
                    // QnA qna list
                    QnAView(setList: getModel.qna, setGodLifeViewType: getGodLifeViewType)
   
                    
                    // 활동 뷰
                    ActivityListView(setList: getModel.activityList, setGodLifeViewType: getGodLifeViewType)
                    
                    // 공지사항
                    GodLifeNoticeView(setList: getModel.notice, setGodLifeViewType: getGodLifeViewType)

                }
            }
        }
        .onDisappear(perform: {
            getVisibleView = false
        })
        .padding(10)
        .background(Color.backgroundColour)
    }
}
