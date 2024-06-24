//
//  CustomBottomSheetType.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

struct GodLifeTopView : View {
    
    @Binding private var getVisibleView : Bool
    private var getViewType : GodLifeViewType
    private var getHostExitGodLife : () -> Void
    private var getMemberExitGodLife : () -> Void
    private var getJoinGodLife : () -> Void
    private var getReportGodLife : (String) -> Void
    init(
        setVisibleView: Binding<Bool>,
        setGodLifeViewType : GodLifeViewType,
        setHostExitGodLife : @escaping () -> Void,
        setMemberExitGodLife : @escaping () -> Void,
        setJoinGodLife : @escaping () -> Void,
        setReportGodLife : @escaping (String) -> Void
    ) {
        self._getVisibleView = setVisibleView
        self.getViewType = setGodLifeViewType
        self.getHostExitGodLife = setHostExitGodLife
        self.getMemberExitGodLife = setMemberExitGodLife
        self.getJoinGodLife = setJoinGodLife
        self.getReportGodLife = setReportGodLife
    }
    
    @State private var isHostExitButtonOpen : Bool = false
    private func updateView() -> some View {
        return HStack(){
            VStack(alignment : HorizontalAlignment.center, spacing: 0){
                // 탈퇴 버튼
                Text(isHostExitButtonOpen ? "방장직을 타인에게 임명하지 않은 경우, 해당 갓생은 사라집니다. 탈퇴를 계속 진행할까요?" : "탈퇴하기")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .onTapGesture {
                        isHostExitButtonOpen = true
                    }
                
                if isHostExitButtonOpen {
                    Divider()
                    GeometryReader { geo in
                        HStack(alignment : VerticalAlignment.center){
                            Text("네")
                                .padding(5)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(
                                    width: (geo.size.width / 2)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        isHostExitButtonOpen.toggle()
                                        getHostExitGodLife()
                                    }
                                }
                            Text("아니요")
                                .padding(5)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(
                                    width: (geo.size.width / 2)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        // 신청버튼
                                        isHostExitButtonOpen.toggle()
                                    }
                                }
                        }
                    }
                    .frame(
                        height: 30
                    )
                }
            }
            .padding(5)
            .background(Color.colourSheet)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
            
            
            Rectangle()
                .fill(Color.clear)
                .frame(
                    width: 25,
                    height: 25
                )
        }
    }
    
    @State private var isMemberExitButtonOpen : Bool = false
    private func joinedView() -> some View {
        return HStack(alignment : VerticalAlignment.center, spacing: 0){
            VStack(alignment : HorizontalAlignment.center, spacing: 0){
                // 탈퇴 버튼
                Text(isMemberExitButtonOpen ? "정말로 탈퇴를 계속 진행할까요?" : "탈퇴하기")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .onTapGesture {
                        isMemberExitButtonOpen = true
                    }
                
                if isMemberExitButtonOpen {
                    Divider()
                    GeometryReader { geo in
                        HStack(alignment : VerticalAlignment.center){
                            Text("네")
                                .padding(5)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(
                                    width: (geo.size.width / 2)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        isMemberExitButtonOpen.toggle()
                                        getMemberExitGodLife()
                                    }
                                }
                            Text("아니요")
                                .padding(5)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(
                                    width: (geo.size.width / 2)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        // 신청버튼
                                        isMemberExitButtonOpen.toggle()
                                    }
                                }
                        }
                    }
                    .frame(
                        height: 30
                    )
                }
            }
            .padding(5)
            .background(Color.colourSheet)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
            
            
            Rectangle()
                .fill(Color.clear)
                .frame(
                    width: 25,
                    height: 25
                )
        }
    }
    
    @State private var isReportSheetOpen : Bool = false
    @State private var reportOpinion : String = ""
    private func readView() -> some View {
        return HStack(alignment : VerticalAlignment.center){
            Text("가입 신청")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .padding(5)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .background(Color.colourSheet)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(5)
                .onTapGesture {
                    // 신청버튼
                    getJoinGodLife()
                }
            
            Image("image_danger")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .onTapGesture {
                    isReportSheetOpen.toggle()
                }
                .bottomSheet(isOpen: $isReportSheetOpen) {
                    VStack(alignment : HorizontalAlignment.leading, spacing: 0){
                        TextField(
                            "신고의 내용을 입력해주세요",
                            text: $reportOpinion
                        )
                        .textFieldStyle(.roundedBorder)
                        
                        Text("신고하기")
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity
                            )
                            .padding(5)
                            .font(.system(size: 20, weight: Font.Weight.bold))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                            )
                            .padding(10)
                            .onTapGesture {
                                // 신고하기
                                getReportGodLife(reportOpinion)
                                isReportSheetOpen.toggle()
                            }
                    }
                }
        }
    }
    
    private func createView() -> some View {
        return HStack(alignment : VerticalAlignment.center){
            Text("개설하기")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .padding(5)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .background(Color.colourSheet)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(5)
                .onTapGesture {
                    
                }
            
            Rectangle()
                .fill(Color.clear)
                .frame(
                    width: 25,
                    height: 25
                )
        }
    }
    
    var body : some View {
        HStack(alignment : VerticalAlignment.center){
            Image("image_back")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    // 뒤로가기
                    getVisibleView.toggle()
                }
            
            switch(getViewType){
            case .Read :
                readView()
            case .Update :
                updateView()
            case .Create :
                createView()
            case .Joined :
                joinedView()
            }
        }//HStack
    }
    
}
