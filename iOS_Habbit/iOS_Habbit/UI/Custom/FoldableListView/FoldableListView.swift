//
//  ExpandableTitledListView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/7/24.
//

import SwiftUI


struct FoldableListView<Content: View>: View {
    
    let setTitle: String
    let setTitleSize : CGFloat
    let setHeight: CGFloat
    @ViewBuilder let setContent: Content

    
    @State private var expandable = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment : VerticalAlignment.center){
                Text(setTitle)
                    .font(.system(size: setTitleSize))
                    .fontWeight(.bold)
                    
                Text(expandable ? "▴" : "▾")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .onTapGesture {
                withAnimation {
                    expandable.toggle()
                }
            }
            
            if expandable {
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
                .transition(.slide)
                .animation(.easeOut)
            }
        }
    }
}



