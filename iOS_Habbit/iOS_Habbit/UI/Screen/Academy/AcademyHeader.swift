//
//  AcademyHeader.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

struct AcademyHeader: View {
    
    @State private var text: String = ""
    @State private var visibleGodLifeCard : Bool = false
    @State private var visibleFilter : Bool = false
    
    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM

    
    var body: some View {
        VStack(
           alignment: .leading,
           content: {
               HStack(
                alignment : VerticalAlignment.center
               ){
                   TextField(
                       "Enter some text",
                       text: $text,
                       onEditingChanged: { (isEditing) in
                           
                       }
                   )
                   .padding(5)
                   .background(
                       RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.black, lineWidth: 1)
                   )
                   .padding(1)

                   
                   // 갓생추가
                   Image("image_add")
                       .resizable()
                       .frame(
                            width: 30,
                            height: 30
                       )
                       .onTapGesture {
                           withAnimation {
                               visibleGodLifeCard.toggle()
                           }
                       }
                   
                   // 필터링
                   Image( "image_filter")
                       .resizable()
                       .frame(
                            width: 30,
                            height: 30
                       )
                       .onTapGesture {
                           withAnimation {
                               withAnimation {
                                   bottomSheetVM.sheetType = .AdademyFilter
                                   bottomSheetVM.sheetVisible.toggle()
                               }
                           }
                       }
               }
               .padding(10)
               
               if visibleGodLifeCard {
                   godLifeCard()
               }
               
               if visibleFilter {
                   filterView()
               }
           }
        )
        .padding(2)
    }
    
    
    @State private var selectedImage: UIImage?
    @State private var isImagePickerShown = false

    func godLifeCard() -> some View {
        HStack(
            alignment: .top
        ){
            // 앨범 이미지
//            if let image = selectedImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//            } else {
//                Button("앨범에서 사진 선택") {
//                    isImagePickerShown.toggle()
//                }
//            }
            Image("")
                .resizable()
                .scaledToFit()
                .padding()
            
            VStack(alignment : HorizontalAlignment.leading){
                editText(setHint: "취미 타이틀", setText: $text)
                editText(setHint: "학원 이름", setText: $text)
                editText(setHint: "학원 위치", setText: $text)
                editText(setHint: "월 이용 가격", setText: $text)
                
            }
        }
//        .sheet(isPresented: $isImagePickerShown) {
//            ImagePicker(selectedImage: self.$selectedImage)
//        }
        .transition(.slide)
    }
    
    let chips : [String] = [
     "지역순", "부가요금순", "리뷰순", "좋아요순", "타입순", "호스트인증"
    ]
    
    func filterView() -> some View {
        RecyclerView(
            setAxis: .HORIZONTAL
        ) {
            ForEach(chips, id: \.self) { item in
                DropDownView(
                    setTitle: item,
                    setList: chips,
                    setOutput: { clickedTitle in
                        text = clickedTitle
                        print("클릭된 메뉴 \(clickedTitle)")
                    }
                )
            }
        }
    }
    
    func editText(setHint : String, setText : Binding<String>) -> some View {
        TextField(
            setHint,
            text: setText,
            onEditingChanged: { (isEditing) in
//                getText = isEditing
            }
        )
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(1)
    }
}
