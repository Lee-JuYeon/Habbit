//
//  CustomBottomSheet.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

struct CustomBottomSheet<Content: View>: View {
    
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
    @State private var offset: CGFloat = 0
    @State private var isDragging = false

    var body: some View {
        if isOpen {
            Color.gray.opacity(0.1)
                .onTapGesture {
                    withAnimation {
                        isOpen = false
                    }
                }
                .overlay {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            VStack {
                                self.getContent
                            }
                            .background(BlurView(style: .light))
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                maxHeight: min(geometry.size.height - geometry.safeAreaInsets.top, geometry.size.height * 0.9),
                                alignment: .top
                            )
                            .clipShape(TopRoundedRectangle(
                                radius: 20,
                                corners: [.topLeft, .topRight])
                            )
                            .transition(.move(edge: .bottom))
                            .offset(y: max(offset, 0))
                            .animation(isDragging ? .none : .easeInOut, value: offset) // Apply animation based on dragging state
                        }
                        .padding(
                            EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                        )
                        .gesture(
                            DragGesture()
                                .updating($translation) { value, state, _ in
                                    state = value.translation.height
                                }
                                .onChanged { value in
                                    if value.translation.height > 0 {
                                        offset = value.translation.height
                                        isDragging = true
                                    }
                                }
                                .onEnded { value in
                                    if offset > geometry.size.height / 3 {
                                        withAnimation {
                                            isOpen = false
                                        }
                                    } else {
                                        withAnimation {
                                            offset = 0
                                        }
                                    }
                                    isDragging = false
                                }
                        )
                    }
                }
        }
    }
}
