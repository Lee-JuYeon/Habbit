//
//  ContactView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/6/24.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.flexible(minimum: 10, maximum: 300))],
            alignment: HorizontalAlignment.leading,
            spacing: 10,
            content: {
                Text("📄 개인정보처리방침")
                    .onTapGesture {
                        // webview 처리방침 페이지로 이동
                    }
                Text("📄 이용약관")
                    .onTapGesture {
                        // webview 이용약관 페이지로 이동
                    }
                Text("📞 고객센터")
                    .onTapGesture {
                        // web view
                    }
                Text("버전 : 0.0.1")
            }
        )
    }
}

