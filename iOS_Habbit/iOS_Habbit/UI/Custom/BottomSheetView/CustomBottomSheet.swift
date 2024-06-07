//
//  CustomBottomSheet.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

struct CustomBottomSheet <Content: View> : View {
    
    @Binding var isOpen: Bool
    private let getContent: Content


    init(
        isOpen: Binding<Bool>,
        @ViewBuilder setContent: () -> Content
    ) {
        self._isOpen = isOpen
        self.getContent = setContent()
    }
    
    @GestureState private var translation: CGFloat = 0
    @State private var offset = CGSize.zero
    @State private var isDragging = false

    
    var body: some View {
        BlurView(style: .light)
            .onTapGesture {
                withAnimation {
                    isOpen = false
                }
            }
            .overlay {
                VStack {
                    Spacer()

                    VStack{
                        self.getContent
                    }
                    .background(Color.colourSheet)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: Alignment.bottom
                    )
                    .clipShape(TopRoundedRectangle(
                        radius: 20,
                        corners: [.topLeft, .topRight])
                    )
                    .transition(.move(edge: .bottom))
                    .offset(y: max(offset.height, 0)) // Apply offset based on drag gesture
                    .animation(isDragging ? .none : .easeInOut)
                }
                .padding(
                    EdgeInsets.init(top: 0, leading: 3, bottom: 0, trailing: 3)
                )
                .gesture(
                    DragGesture()
                        .updating($translation) { value, state, _ in
                            state = value.translation.height
                        }
                        .onChanged { value in
                            if value.translation.height > 0 && offset.height < UIScreen.main.bounds.height / 10 {
                                offset = CGSize(width: 0, height: value.translation.height)
                                isDragging = true
                            }
                        }
                        .onEnded { value in
                            if offset.height + value.translation.height > UIScreen.main.bounds.height / 10 {
                                withAnimation {
                                    isOpen = false
                                }
                            }
                            offset = .zero
                            isDragging = false
                        }
                )
            }
            .edgesIgnoringSafeArea(.all)
    }
}
