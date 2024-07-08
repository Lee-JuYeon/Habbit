//
//  InfoImageView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/25/24.
//

import SwiftUI

struct InfoImageView: View {
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    @State private var guideModel = GodLifeModel.guidModel
    
   
    @State private var isOpenImage = false
    @State private var imageFromServer = ""
    @State private var imageFromAlbum: UIImage? = nil
    private func imageErrorView() -> some View {
        VStack(alignment: .center, spacing: 10) {
            Text("이미지를 불러오지 못했습니다.")
            ProgressView()
        }
        .frame(width: 150, height: 150)
        .background(Rectangle().stroke(lineWidth: 1))
    }
    private func uploadUpdateImageToServer(image : UIImage){
        // 서버에 이미지 업로드
        image
        
        //imageFromAlbum nil처리
        imageFromAlbum = nil // nil로 해놔야 update타입때 albumImage변수를 트리거로 서버에서 받아온 이미지를 보여줄지 아니면 새로 업롣한 이미지를 보여줄지 판별이됨
    }
    // uploadUpdateImageToServer(image: imageFromAlbum!)
   
    
    var body: some View {
        ProgressView()
            .onAppear(perform: {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
            })
            .frame(width: 150, height: 150)
            .overlay(content: {
                switch getGodLifeViewType {
                case .Create:
                    if let albumImage = imageFromAlbum {
                        Image(uiImage: albumImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                isOpenImage.toggle()
                            }
                            .fullScreenCover(isPresented: $isOpenImage) {
                                ImagePicker(selectedImage: $imageFromAlbum)
                            }
                    } else {
                        Image("image_picture")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                isOpenImage.toggle()
                            }
                            .fullScreenCover(isPresented: $isOpenImage) {
                                ImagePicker(selectedImage: $imageFromAlbum)
                            }
                    }
                case .Update:
                    if let albumImage = imageFromAlbum {
                        Image(uiImage: albumImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                isOpenImage.toggle()
                            }
                            .fullScreenCover(isPresented: $isOpenImage) {
                                ImagePicker(selectedImage: $imageFromAlbum)
                            }
                    } else {
                        AsyncImage(url: URL(string: imageFromServer)) { phase in
                            switch phase {
                            case .empty:
                                Image("image_picture")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                
                            case .failure(_):
                                imageErrorView()
                            @unknown default:
                                imageErrorView()
                            }
                        }
                        .onTapGesture {
                            isOpenImage.toggle()
                        }
                        .fullScreenCover(isPresented: $isOpenImage) {
                            ImagePicker(selectedImage: $imageFromAlbum)
                        }
                    }
                case .Joined, .Read:
                    AsyncImage(url: URL(string: getModel.image!)) { phase in
                        switch phase {
                        case .empty:
                            Image("image_picture")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            
                        case .failure(_):
                            imageErrorView()
                        @unknown default:
                            imageErrorView()
                        }
                    }
                }
            })
            
    }
}
