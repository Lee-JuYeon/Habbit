//
//  SocialView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI


enum SocialType {
    case INSTA
    case YOUTUBE
}

struct SocialView: View {
    
    let setID : String?
    let setSocialType : SocialType
    
    var body: some View {
        
        switch(setSocialType){
        case .INSTA :
            if(setID != nil){
                Image("image_insta")
                    .resizable()
                    .frame(
                        width: 20,
                        height: 20
                    )
                    .onTapGesture {
                        let url = "https://www.instagram.com/\(setID!)/"
                        openWebsite(urlString: url)
                    }
            }
        case .YOUTUBE :
            if(setID != nil){
                Image("image_youtube")
                    .resizable()
                    .frame(
                        width: 20,
                        height: 20
                    )
                    .onTapGesture {
                        let url = "https://www.youtube.com/\(setID!)"
                        openWebsite(urlString: url)
                    }
            }
        }
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
}
