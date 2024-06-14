//
//  CustomBottomSheetVM.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

import SwiftUI

struct ExampleView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("some")
                Text("some")
                Text("some")
            }
            .navigationBarTitle("네비게이션")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: secondView(),
                        label: {
                            Image(systemName: "person.fill")
                                .foregroundColor(.red)
                        })
            )
        }
    }
}
struct secondView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.yellow.ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .padding()
            })
            .accentColor(.white)
        }
    }
}

#Preview {
    ExampleView()
}
