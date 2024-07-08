//
//  ReviewListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/9/24.
//

import SwiftUI

struct HostReviewList: View {
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    @State private var createSheetOpen = false
    @State private var starRate = 0.0
    private func createItem() -> some View {
        return Text("🖋️ 후기 작성하기")
            .padding(5)
            .font(.system(size: 17, weight: .bold))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            )
            .padding(5)
            .onTapGesture {
                createSheetOpen.toggle()
            }
            .fullScreenCover(isPresented: $createSheetOpen) {
                sheetView()
            }
        
    }
    @State private var reviewText = ""
    @State private var reviewRate = 0.0
    @State private var imageFromAlbum: UIImage? = nil
    @State private var albumOpen = false
    private func sheetView() -> some View {
        return VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            Image("image_back")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    // 뒤로가기
                    createSheetOpen.toggle()
                }
            
            HStack(alignment : VerticalAlignment.top){
                if let image = imageFromAlbum {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            albumOpen.toggle()
                        }
                        .fullScreenCover(isPresented: $albumOpen) {
                            ImagePicker(selectedImage: $imageFromAlbum)
                        }
                }else {
                    Image("image_picture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            albumOpen.toggle()
                        }
                        .fullScreenCover(isPresented: $albumOpen) {
                            ImagePicker(selectedImage: $imageFromAlbum)
                        }
                }
                VStack(alignment: HorizontalAlignment.center, spacing: 0){
                    Text("별점 선택")
                        .font(.system(size: 20, weight: .bold))
                    Picker("별점 선택", selection: $reviewRate) {
                        ForEach(0...50, id: \.self) { i in
                            Text("\(Double(i)/10, specifier: "%.1f")")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
            }
            
            TextField(
                "후기를 작성해주세요",
                text: $reviewText
            )
            .textFieldStyle(.roundedBorder)
            
            Text("후기 작성 완료")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .center
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                )
                .onTapGesture {
                    createSheetOpen.toggle()
                }
            
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity
        )
        .padding(5)
    }
    
    @State private var imageExpand = false
    private func item(model : ReviewModel) -> some View {
        let imageSize = 30.0
        return VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            HStack(alignment: VerticalAlignment.center, spacing: 2){
                Image("image_star")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: imageSize,
                        height: imageSize
                    )
                
                Text(String(format: "%.1f", model.stars))
                    .frame(
                        width: imageSize,
                        height: imageSize
                    )
                    .padding(EdgeInsets(top: 5, leading: 2, bottom: 0, trailing: 0))
            }
            
            if let getImage = model.image {
                AsyncImage(
                    url: URL(string: getImage)
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder : {
                    ProgressView()
                }
                .onTapGesture {
                    imageExpand.toggle()
                }
                .frame(
                    width: 200
                )
            }else{
                Text("서버로부터 이미지를 받아오지 못했음.")
                    
            }
            
            ScrollView(.vertical, showsIndicators: false){
                Text(model.reviews)
            }
        }
        .frame(
            width: 200,
            height: 400
        )
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
        )
        .fullScreenCover(isPresented: $imageExpand, content: {
            if let getImage = model.image {
                AsyncImage(
                    url: URL(string: getImage)
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder : {
                    ProgressView()
                }
                .onTapGesture {
                    imageExpand.toggle()
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
            }else{
                VStack(alignment: HorizontalAlignment.center){
                    Text("서버로부터 이미지를 받아오지 못했음.")
                        
                    Text("뒤로가기")
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        )
                        .onTapGesture {
                            imageExpand.toggle()
                        }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
            }
        })
    }
    
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading){
            HStack(alignment: VerticalAlignment.center, spacing: 3){
                Text("후기")
                    .font(.system(size: 30, weight: .bold))
                
                if getGodLifeViewType == .Joined {
                    createItem()
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment : VerticalAlignment.top){
                    ForEach(getModel.reviewList, id: \.self){ model in
                        // 리뷰 리스트 아이탬
                        item(model: model)
                    }// ForEach
                }// LazyHStack
            }//Scrollview
        }// vstack
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
    }
}
