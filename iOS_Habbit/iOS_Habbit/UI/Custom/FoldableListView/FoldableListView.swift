//
//  ExpandableTitledListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI


struct FoldableListView<Content: View>: View {
    
    let setTitle: String
    let setHeight: CGFloat
    @ViewBuilder let setContent: Content

    var body: some View {
        VStack(alignment: .leading) {
            Text(setTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(10)
            
            ScrollView(.vertical, showsIndicators: false) {
                setContent
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: setHeight,
                alignment: .topLeading
            )
        }
    }
}



