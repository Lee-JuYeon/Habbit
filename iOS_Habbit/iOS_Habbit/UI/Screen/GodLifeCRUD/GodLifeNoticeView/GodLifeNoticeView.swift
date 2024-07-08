//
//  GodLifeNoticeView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/8/24.
//

import SwiftUI

struct GodLifeNoticeView: View {
    
    let setList : [GodLifeNotification]
    let setGodLifeViewType : GodLifeViewType
    
    @State private var list : [GodLifeNotification] = []
    @State private var noticeTitle = ""
    @State private var noticeContent = ""
    @State private var sheetOpen = false
    private func sheetView() -> some View {
        return VStack(){
            TextField(
                "공지 제목",
                text: $noticeTitle
            )
            .textFieldStyle(.roundedBorder)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            
            TextField(
                "공지 내용",
                text: $noticeContent
            )
            .textFieldStyle(.roundedBorder)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            
            Text("공지사항 추가")
                .padding(5)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .center
                )
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                )
                .onTapGesture {
                    let model = GodLifeNotification(
                        godLifeUID: "갓생 uid",
                        notificationUID: "공지사항 uid",
                        title: noticeTitle,
                        notice: noticeContent,
                        date: "오늘 날짜",
                        writerUID: "myAuthUID"
                    )
                    list.insert(model, at: 0)
                    sheetOpen.toggle()
                    
                    print("서버와 리스트에 모델추가 : \(model)")
                }
        }
        .onAppear {
            list = setList
        }
    }
    
    private func titleView() -> some View {
        return HStack(alignment: VerticalAlignment.center, spacing: 2){
            Text("공지사항")
                .font(.system(size: 30, weight: .bold))
            
            if setGodLifeViewType == .Update {
                Text("공지추가")
                    .padding(2)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
                    .padding(2)
                    .onTapGesture {
                        sheetOpen.toggle()
                    }
                    .fullScreenCover(isPresented: $sheetOpen) {
                        sheetView()
                    }
            }
        }
    }
    
    @State private var expandableItem = false
    private func itemView(setModel getModel : GodLifeNotification) -> some View {
        return VStack(){
            Text(getModel.title)
                .font(.system(size: 20, weight: .bold))
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            if expandableItem {
                Text(getModel.notice)
                    .font(.system(size: 15, weight: .regular))
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            }
            
            Text(getModel.date)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .trailing
                )
        }
        .padding(5)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(5)
        .onTapGesture {
            expandableItem.toggle()
        }
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 2){
                    titleView()
                    
                    ForEach(setList, id: \.self){ model in
                        itemView(setModel: model)
                    }
                }
            }
        }
    }
}
