//
//  SocialView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI




struct HostSocialView: View {
    
    
    private var getUserModel : UserModel
    private var getGodLifeViewType : GodLifeViewType
    init(
        setUserModel : UserModel,
        setGodLifeViewType : GodLifeViewType
    ) {
        self.getUserModel = setUserModel
        self.getGodLifeViewType = setGodLifeViewType
    }
    
    private func openWebsite(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        // Check if Instagram app is installed
        if UIApplication.shared.canOpenURL(url) {
            // Open Instagram app with post URL
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Handle case where Instagram app is not installed
            print("Error: Instagram app not found.")
        }
    }
    
    
    @State private var sheetOpen = false
    @State private var socialID = ""
    @State private var youtubeIdText = ""
    @State private var instaIdText = ""
    var body: some View {
        HStack(){
            ForEach(Array(getUserModel.socialMedia), id: \.key){ key, value in
                Image(key == "insta" ? "image_insta" : "image_youtube" )
                    .resizable()
                    .frame(
                        width: 20,
                        height: 20
                    )
                    .onTapGesture {
                        switch(getGodLifeViewType){
                        case .Create :
                            sheetOpen.toggle()
                        case .Update :
                            sheetOpen.toggle()
                        case .Read, .Joined :
                            let urlString = key == "insta"
                                           ? "https://www.instagram.com/\(value)/"
                                           : "https://www.youtube.com/\(value)"
                            openWebsite(urlString: urlString)
                        }
                    }
            }
            
            if getGodLifeViewType == .Create || getGodLifeViewType == .Update {
                Button(action: {
                    // save insta, youtube id
                    instaIdText
                    youtubeIdText
                    sheetOpen.toggle()
                }) {
                    Image("image_add")
                        .resizable()
                        .renderingMode(.template)
                        .frame(
                            width: 20,
                            height: 20
                        )
                        .onAppear {
                            if getGodLifeViewType == .Create  {
                                instaIdText = ""
                                youtubeIdText = ""
                            }else if getGodLifeViewType == .Update  {
                                instaIdText = getUserModel.socialMedia["insta"] ?? ""
                                youtubeIdText = getUserModel.socialMedia["youtube"] ?? ""
                            }
                        }
                        .sheet(isPresented: $sheetOpen) {
                            VStack(alignment: HorizontalAlignment.leading, spacing: 10){
                                HStack(alignment: VerticalAlignment.center, spacing: 5){
                                    Image("image_insta")
                                        .resizable()
                                        .frame(
                                            width: 20,
                                            height: 20
                                        )
                                    TextField(
                                       "example) abcdabc",
                                       text: $instaIdText
                                    )
                                }
                               
                                HStack(alignment: VerticalAlignment.center, spacing: 5){
                                    Image("image_youtube")
                                        .resizable()
                                        .frame(
                                            width: 20,
                                            height: 20
                                        )
                                    TextField(
                                       "example) @abcdabcd",
                                       text: $youtubeIdText
                                    )
                                }
                                
                                Text("저장하기")
                                    .padding(10)
                                    .frame(
                                        minWidth: 0,
                                        maxWidth: .infinity,
                                        alignment: .center
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 2)
                                    )
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(10)
                                    .onTapGesture {
                                        sheetOpen.toggle()
                                    }
                            }
                            
                           
                        }
                }
                
                
            }
        }
    }
}
//                if key == "insta" {
//                    Image(key == "image_insta" ? "image_insta" : "image_youtube" )
//                        .resizable()
//                        .frame(
//                            width: 20,
//                            height: 20
//                        )
//                        .onTapGesture {
//                            switch(getGodLifeViewType){
//                            case .Create :
//                                sheetOpen.toggle()
//                            case .Update :
//                                sheetOpen.toggle()
//                            case .Read, .Joined :
//                                let url = "https://www.instagram.com/\(getUserModel.socialMedia[key])/"
//                                openWebsite(urlString: key == "image_insta" ? "https://www.instagram.com/\(getUserModel.socialMedia[key])/" : "https://www.youtube.com/\(getUserModel.socialMedia[key])")
//                            }
//                        }
//                }else if key == "youtube"{
//                    Image("image_youtube")
//                        .resizable()
//                        .frame(
//                            width: 20,
//                            height: 20
//                        )
//                        .onTapGesture {
//                            switch(getGodLifeViewType){
//                            case .Create :
//                                sheetOpen.toggle()
//                            case .Update :
//                                sheetOpen.toggle()
//                            case .Read, .Joined :
//                                let url = "https://www.youtube.com/\(getUserModel.socialMedia[key])"
//                                openWebsite(urlString: url)
//                            }
//                        }
//                }
   
//        switch(getSocialType){
//        case .INSTA :
//            if(getID != nil){
//                Image("image_insta")
//                    .resizable()
//                    .frame(
//                        width: 20,
//                        height: 20
//                    )
//                    .onTapGesture {
//                        switch(getGodLifeViewType){
//                        case .Create :
//                            sheetOpen.toggle()
//                        case .Update :
//                            sheetOpen.toggle()
//                        case .Read, .Joined :
//                            let url = "https://www.instagram.com/\(getID!)/"
//                            openWebsite(urlString: url)
//                        }
//                    }
//            }
//        case .YOUTUBE :
//            if(getID != nil){
//                Image("image_youtube")
//                    .resizable()
//                    .frame(
//                        width: 20,
//                        height: 20
//                    )
//                    .onTapGesture {
//                        switch(getGodLifeViewType){
//                        case .Create :
//                            sheetOpen.toggle()
//                        case .Update :
//                            sheetOpen.toggle()
//                        case .Read, .Joined :
//                            let url = "https://www.youtube.com/\(getID!)"
//                            openWebsite(urlString: url)
//                        }
//                    }
//            }
//        }
//    }
    

