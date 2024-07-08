//
//  ActivityAddButton.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 7/6/24.
//

import SwiftUI

struct ActivityAddButton : View {
    
    let setGodLifeViewType : GodLifeViewType
    
    @State private var sheetOpen = false
    @State private var picAlbum : UIImage? = nil
    private func uploadActivityToServer(onSuccess : @escaping () -> ()){
        guard let image = picAlbum, let pngData = image.pngData() else {
            print("이미지가 없거나 PNG 데이터로 변환할 수 없습니다.")
            return
        }
        
        let model = ActivityModel(
            godLifeUID: "uid1",
            images: [
                ActivityImageModel(
                    imageUID: "image uid 1",
                    godLifeUID: "uid1",
                    uploadedUserUID: "myAuthUID",
                    imagePath: "",
                    date: Date().ISO8601Format() // 현재 날짜를 ISO8601 형식의 문자열로 변환
                )
            ],
            date: Date().ISO8601Format() // 현재 날짜를 ISO8601 형식의 문자열로 변환
        )
        
        // 여기에 서버로 model을 전송하는 코드를 추가하세요
        // 예: sendModelToServer(model)
        
        onSuccess()
    }
    
    private func sheetView() -> some View {
        return VStack(alignment: HorizontalAlignment.center, spacing: 5){
            if let albumImage = picAlbum {
                Image(uiImage: albumImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        sheetOpen.toggle()
                    }
                    .fullScreenCover(isPresented: $sheetOpen) {
                        ImagePicker(selectedImage: $picAlbum)
                    }
            } else {
                Image("image_picture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        sheetOpen.toggle()
                    }
                    .fullScreenCover(isPresented: $sheetOpen) {
                        ImagePicker(selectedImage: $picAlbum)
                    }
            }
            Text("활동 추가하기")
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
                    uploadActivityToServer(
                        onSuccess: {
                            sheetOpen.toggle()
                        }
                    )
                }
        }
    }
    
    var body: some View {
        if setGodLifeViewType == .Update {
            Text("활동추가")
                .font(.system(size: 20, weight: .regular))
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                )
                .padding(5)
                .onTapGesture {
                    sheetOpen.toggle()
                    print("sheetOpen : \(sheetOpen)")
                }
                .fullScreenCover(isPresented: $sheetOpen) {
                    sheetView()
                }
        }
    }
}
