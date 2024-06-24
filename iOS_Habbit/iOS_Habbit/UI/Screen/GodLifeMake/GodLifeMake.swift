//
//  GodLifeMake.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/11/24.
//

import SwiftUI

struct GodLifeMake: View {
    
    @Binding private var getVisibleView : Bool
    init(
        setVisibleView : Binding<Bool>
    ){
        self._getVisibleView = setVisibleView
    }
    
    
    @State private var text: String = ""
    @EnvironmentObject private var screenVM : ScreenVM
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            HStack(alignment : VerticalAlignment.center){
                Image("image_back")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 25,
                        height: 25
                    )
                    .onTapGesture {
                        getVisibleView.toggle()
                    }
                
                Text("저장하기")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                    .background(Color.sheetColour)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        
                    }
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(
                        width: 25,
                        height: 25
                    )
            }
            .padding(10)
            
            HStack(alignment : VerticalAlignment.top){
                //모임 이미지
                AsyncImage(
                    url: URL(string: "")
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                } placeholder : {
                    ProgressView()
                        .frame(width: 150, height: 150)
                }//AsyncImage
                
                
                VStack(alignment : HorizontalAlignment.leading){
                    TextField(
                        "갓생 이름",
                        text: $text
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    TextField(
                        "모임 위치 (온라인, 오프라인)",
                        text: $text
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    TextField(
                        "모임 가격(무료, 유료)",
                        text: $text
                    )
                    .keyboardType(.numberPad) // 숫자 키보드 타입 설정
                    .onChange(of: text) { newValue in
                        // 숫자만 필터링
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.text = filtered
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
            }
            TextField(
                "모임 설명",
                text: $text
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            HStack(alignment : VerticalAlignment.top){
                // 호스트 이미지
                AsyncImage(
                    url: URL(string: "")
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                } placeholder : {
                    ProgressView()
                        .frame(width: 150, height: 150)
                }//AsyncImage
                
                VStack(alignment : HorizontalAlignment.leading){
                    // 호스트 이름
                    TextField(
                        "방장 이름",
                        text: $text
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField(
                        "인스타 아이디",
                        text: $text
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField(
                        "@유튜브 아이디",
                        text: $text
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    // 호스트 경력
                }
            }
            TextField(
                "방장 자기소개",
                text: $text
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
           
            Text("경력")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(
                    EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 0)
                )
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .leading
                )
            VStack(alignment : HorizontalAlignment.leading){
                careerHeader()
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack(alignment : HorizontalAlignment.leading){
                        ForEach(CareerModel.dummyList, id: \.self){ model in
                            careerItem(model: model)
                        }
                    }
                }
            }
            .padding(5)

            
        }
        .background(Color.colourBackground)
    }
    
    private func careerHeader() -> some View {
        return HStack(alignment : VerticalAlignment.center){
            VStack(alignment : HorizontalAlignment.center){
                TextField(
                    "경력 이름",
                    text: $text
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField(
                    "경력 내용",
                    text: $text
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Text("추가하기")
                .frame(
                    minHeight: 0,
                    maxHeight: .infinity
                )
                .padding(5)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .background(Color.sheetColour)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    // 경력 추가버튼
                }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity
        )
        .padding(5)
        .background(
            Rectangle().stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        )
    }
    
    private func careerItem(model : CareerModel) -> some View {
        return VStack(alignment : HorizontalAlignment.leading){
            ZStack(alignment:.topTrailing){
                Text(model.title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                
                Image("image_cancel")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.red)
                    .frame(
                        width: 30,
                        height: 30
                    )
                    .onTapGesture {
                        // delete item
                    }
                
            }
            Text(model.career)
                .font(.system(size: 15))
        }
        .padding(5)
        .background(
            Rectangle().stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        )
    }
    
}

