//
//  AcademyHeader.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

//struct GodLifeHeader: View {
//    
//    @Binding private var setText: String
//    @State private var visibleGodLifeCard : Bool = false
//    @State private var visibleFilter : Bool = false
//    
//    @EnvironmentObject private var bottomSheetVM : CustomBottomSheetVM
//    @EnvironmentObject private var screenVM : ScreenVM
//    
//    var body: some View {
//        VStack(
//           alignment: .leading,
//           content: {
//               HStack(
//                alignment : VerticalAlignment.center
//               ){
//                   TextField(
//                       "Enter some text",
//                       text: $setText,
//                       onEditingChanged: { (isEditing) in
//                           
//                       }
//                   )
//                   .padding(5)
//                   .background(
//                       RoundedRectangle(cornerRadius: 10)
//                           .stroke(Color.black, lineWidth: 1)
//                   )
//                   .padding(1)
//
//                   
//                   // 갓생추가
//                   Image("image_add")
//                       .resizable()
//                       .frame(
//                            width: 30,
//                            height: 30
//                       )
//                       .onTapGesture {
//                           screenVM.screenType = .GodLife_Make
//                       }
//                   
//                   // 필터링
//                   Image( "image_filter")
//                       .resizable()
//                       .frame(
//                            width: 30,
//                            height: 30
//                       )
//                       .onTapGesture {
//                           withAnimation {
//                               withAnimation {
//                                   bottomSheetVM.sheetType = .AdademyFilter
//                                   bottomSheetVM.sheetVisible.toggle()
//                               }
//                           }
//                       }
//               }
//               .padding(10)
//            
//               
//               if visibleFilter {
//                   filterView()
//               }
//           }
//        )
//        .padding(2)
//    }
//    
//    
//    
//    func editText(setHint : String, setText : Binding<String>) -> some View {
//        TextField(
//            setHint,
//            text: setText,
//            onEditingChanged: { (isEditing) in
////                getText = isEditing
//            }
//        )
//        .padding(5)
//        .background(
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.black, lineWidth: 1)
//        )
//        .padding(1)
//    }
//}
