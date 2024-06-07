//
//  AcademyCell.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

struct AcademyCell : View {
    
    private var getModel : AcademyModel? = nil
    init(
        setModel : AcademyModel
    ){
        self.getModel = setModel
    }
    
    private let dummyImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiVMXkVnFDabJrNMhQ4A5xZvVqXh3Nv2gYWg&s"
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM


    var body : some View {
        HStack(
            alignment: .top
        ){
            // 네트워크 이미지
            AsyncImage(
                url: URL(string: getModel?.image ?? dummyImage)
            ) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } placeholder : {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            LazyVStack(alignment : HorizontalAlignment.leading){
                Text("취미 타이틀")
                Text("학원 이름")
                Text("📍 학원 위치")
                Text("💵 월 이용 가격")
            }
        }
        .onTapGesture {
            withAnimation {
                bottomSheetVM.academyModel = getModel
                bottomSheetVM.sheetType = .AcademyCell
                bottomSheetVM.sheetVisible.toggle()
            }
        }
        .frame(maxHeight: 150)
        .swipeActions(edge: .trailing){
            Button(action: {
                // 저장 액션 수행
                print("Save tapped for ")
            }) {
                Label("Save", systemImage: "square.and.arrow.down")
            }
        }
        .swipeActions(edge: .trailing){
            Button(action: {
                // 신고 액션 수행
                print("신고 tapped for ")
            }) {
                Label("신고", systemImage: "square.and.arrow.down")
            }
        }
    }
}
