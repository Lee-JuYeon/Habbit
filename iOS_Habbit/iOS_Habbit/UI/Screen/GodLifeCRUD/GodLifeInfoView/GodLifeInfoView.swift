//
//  SafariView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/6/24.
//

//        getGodLifeViewType == .Create ? guideModel.title : getModel.title


import SwiftUI


struct GodLifeInfoView : View {
    
    @Binding private var getModel : GodLifeModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setModel: Binding<GodLifeModel>,
        setGodLifeViewType : GodLifeViewType
    ) {
        self._getModel = setModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    private func monthlyPayConverter(pay : Double?) -> String {
        return switch(pay){
        case 0.0 :
            "무료"
        case nil :
            "무료"
        default :
            String(format: "%.0f", pay ?? "무료") + "원"
        }
    }
    
    @State private var guideModel = GodLifeModel.guidModel
    
    @State private var isOpenTitle = false
    @State private var newTitle = ""
    @State private var hint : String = ""
    private func manageTitleViewStrings(){
        switch getGodLifeViewType {
        case .Create:
            hint = guideModel.title
            newTitle = guideModel.title
        case .Update:
            hint = "갓생이름을 바꿀 수 있습니다"
            newTitle = getModel.title
        case .Read :
            hint = getModel.title
            newTitle = getModel.title
        case .Joined :
            hint = getModel.title
            newTitle = getModel.title
        }
    }
    private func titleView() -> some View {
        return Text(newTitle)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .font(.system(size: 30, weight: .bold))
            .background(Color.red)
            .onTapGesture {
                if getGodLifeViewType == .Update || getGodLifeViewType == .Create {
                    isOpenTitle.toggle()
                }
            }
            .bottomSheet(isOpen: $isOpenTitle) {
                VStack(){
                    TextField(
                        hint,
                        text: $newTitle
                    )
                    .onAppear(perform: {
                        if newTitle == "클릭하여 갓생 이름 설정" {
                            newTitle = ""
                        }
                    })
                    .onChange(of: newTitle) { newValue in
                        newTitle = newValue
                        print ("myMoney: \(newValue)")
                    }
                    .textFieldStyle(.roundedBorder)
                    
                    Text("완료")
                        .padding(5)
                        .font(.system(size: 20, weight: .bold))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        )
                        .padding(5)
                        .onTapGesture {
                            isOpenTitle.toggle()
                        }
                }.onDisappear(perform: {
                    if newTitle == "" {
                        newTitle = "클릭하여 갓생 이름 설정"
                    }
                })
            }
    }
    
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
    private func mImageView() -> some View {
        return VStack(alignment: .center, spacing: 10) {
//            Text("이미지를 불러오지 못했습니다.")
            ProgressView()
        }
        .frame(width: 150, height: 150)
        .background(Rectangle().stroke(lineWidth: 1))
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
                    Image("image_star")
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
                            Image("image_star")
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
                        Image("image_star")
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
  
    
    @State private var isOpenLocation = false
    private func locationView() -> some View {
        return VStack(alignment: HorizontalAlignment.leading){
            
        }
    }
    
    @State private var isOpenPrice = false
    private func payView() -> some View {
        return VStack(alignment: HorizontalAlignment.leading){
            
        }
    }
    
    @State private var isOpenType = false
    private func typeView() -> some View {
        return VStack(alignment: HorizontalAlignment.leading){
            
        }
    }
   
    @State private var isOpenBio = false
    private func bioView() -> some View {
        return VStack(alignment: HorizontalAlignment.leading){
            
        }
    }
    
  
    var body: some View {
        VStack(alignment : HorizontalAlignment.leading, spacing: 5){
            titleView()
            HStack(alignment : VerticalAlignment.center,spacing: 0){
                mImageView()
                VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    typeView()
                    locationView()
                    payView()
                }
            }
            bioView()
        }
        .onAppear {
            manageTitleViewStrings()
        }
    }
}

/*
 
 @State private var titleValue = ""
 private func titleEditView() -> some View {
     return VStack(){
         Text("갓생 제목 수정")
             .font(.system(size: 30, weight: Font.Weight.bold))

         TextField(
             getModel.title,
             text: $titleValue
         )
         .textFieldStyle(RoundedBorderTextFieldStyle())
         
         Text("저장")
             .font(.system(size: 20, weight: Font.Weight.light))
             .onTapGesture {
                 isOpenTitle.toggle()
             }
     }
     .maxFrameSize()
 }
 
 @State private var isOpenLocation = false
 private func editLocationView() -> some View {
     return VStack{
         
     }
     .maxFrameSize()
 }
 @State private var isOpenMonthPay = false
 @State private var isOpenExplain = false
 var body: some View {
     VStack {
         ScrollView(.horizontal, showsIndicators: false){
             Text(getModel.title)
                 .font(.system(size: 30))
                 .fontWeight(.bold)
                 .onTapGesture {
                     if getGodLifeViewType == .Update {
                         isOpenTitle.toggle()
                     }
                 }
                 .bottomSheet(isOpen: $isOpenTitle) {
                     titleEditView()
                 }
         }

         HStack(
             alignment : VerticalAlignment.top
         ){
             // 취미 이미지
             AsyncImage(
                 url: URL(string: getModel.image ?? "")
             ) { image in
                 image
                     .resizable()
                     .scaledToFit()
                     .frame(width: 150, height: 150)
             } placeholder : {
                 VStack(alignment : HorizontalAlignment.center, spacing: 15.0){
                     Text("클릭하여 사진을 추가해주세요")
                     ProgressView()
                         
                 }
                 .frame(
                     width: 150,
                     height: 150
                 )
             }
             .background(
                 Rectangle().stroke(.black, lineWidth: 1.0)
             )
             
             VStack(
                 alignment:HorizontalAlignment.leading
             ){
                 Text("📍 \(getModel.location)")
                     .font(.system(size: 20))
                     .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                     .onTapGesture {
                         if getGodLifeViewType == .Update {
                             isOpenLocation.toggle()
                         }
                     }
                     .bottomSheet(isOpen: $isOpenLocation) {
                         Text("")
                     }
                 
                 Text("💵 \(monthlyPayConverter(pay: getModel.monthlyPay))")
                     .font(.system(size: 20))
                     .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                     .onTapGesture {
                         if getGodLifeViewType == .Update {
                             isOpenMonthPay.toggle()
                         }
                     }
                     .bottomSheet(isOpen: $isOpenMonthPay) {
                         Text("")
                     }
                 
                 Text(getModel.explain)
                     .font(.system(size: 20))
                     .onTapGesture {
                         if getGodLifeViewType == .Update {
                             isOpenExplain.toggle()
                         }
                     }
                     .bottomSheet(isOpen: $isOpenExplain) {
                         Text("")
                     }
                 
             }//VStack
         }//HStaack
     }
 }
 
 */
