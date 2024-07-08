//
//  HostCareerView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/27/24.
//

import SwiftUI

struct HostCareerView: View {
    
    @State private var userModel: UserModel
    private var godLifeViewType: GodLifeViewType
    
    init(setUserModel: UserModel, setGodLifeViewType: GodLifeViewType) {
        _userModel = State(initialValue: setUserModel)
        self.godLifeViewType = setGodLifeViewType
    }
    
    @State private var isSheetOpen = false
    @State private var careerTitleText = ""
    @State private var careerContentText = ""
    @State private var careerList: [CareerModel] = []
    
    private func sheetContentView() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("image_back")
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
                .onTapGesture {
                    isSheetOpen.toggle()
                }
            TextField("경력 이름", text: $careerTitleText)
                .textFieldStyle(.roundedBorder)
            
            TextField("경력 내용", text: $careerContentText)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                if !careerTitleText.isEmpty || !careerContentText.isEmpty {
                    careerList.append(CareerModel(title: careerTitleText, career: careerContentText))
                    careerTitleText = ""
                    careerContentText = ""
                }
            }) {
                Text("저장")
                    .padding(3)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                    .cornerRadius(10)
            }
            .padding(3)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(careerList) { careerModel in
                        HStack(alignment: .center) {
                            Text("삭제")
                                .font(.system(size: 15, weight: .bold))
                                .onTapGesture {
                                    if let index = careerList.firstIndex(where: { $0.id == careerModel.id }) {
                                        careerList.remove(at: index)
                                    }
                                }
                            VStack(alignment: .leading, spacing: 2) {
                                Text(careerModel.title)
                                    .font(.system(size: 15, weight: .bold))
                                Text(careerModel.career)
                                    .font(.system(size: 13, weight: .light))
                            }
                        }
                        .padding(5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                        )
                        .padding(5)
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 5) {
                Text("경력")
                    .font(.system(size: 30, weight: .bold))

                if godLifeViewType == .Create || godLifeViewType == .Update {
                    Button(action: {
                        isSheetOpen.toggle()
                    }) {
                        Text("수정")
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                            )
                            .font(.system(size: 15))
                    }
                    .padding(5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(userModel.careers) { careerModel in
                    VStack(alignment: .leading) {
                        Text(careerModel.title)
                            .font(.system(size: 18))
                            .lineLimit(1)
                        Text(careerModel.career)
                            .font(.system(size: 15))
                            .lineLimit(1)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(5)
                    .background(Color.colourSheet)
                    .cornerRadius(10)
                }
            }
        }
        .onAppear {
            careerList = userModel.careers
        }
        .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: .infinity)
        .fullScreenCover(isPresented: $isSheetOpen) {
            sheetContentView()
        }
    }
}
