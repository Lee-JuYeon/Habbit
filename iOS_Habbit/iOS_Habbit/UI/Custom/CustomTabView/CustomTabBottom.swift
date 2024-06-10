//
//  CustomTabBottom.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct CustomTabBottom: View {
    
    private var getTabItemModels: [CustomTabItemModel]
    private var getTabItemImageSize: CGFloat
    private var getItemClicked: (String) -> Void
    @Environment(\.colorScheme) private var scheme
    @State private var currentItem: String
    
    init(
        setTabItemModels: [CustomTabItemModel],
        setTabItemImageSize: CGFloat,
        setItemCliekd: @escaping (String) -> Void
    ) {
        self.getTabItemModels = setTabItemModels
        self.getTabItemImageSize = setTabItemImageSize
        self.getItemClicked = setItemCliekd
        self._currentItem = State(initialValue: setTabItemModels.first?.title ?? "tab_mates")
    }
    
    
    var body: some View {
        VStack(
            alignment: HorizontalAlignment.center,
            spacing: 0
        ){
            Rectangle()
                .fill(Color.black)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 1,
                    maxHeight: 1,
                    alignment: .center
                )
            LazyHStack(
                alignment: .center,
                spacing: 30,
                content: {
                    ForEach(getTabItemModels, id : \.self){ model in
                        CustomTabBottomItem(
                            setModel: model,
                            setCurrentItem: $currentItem,
                            setTabItemImageSize: getTabItemImageSize,
                            setItemCliekd: { clickedItemTitle in
                                getItemClicked(clickedItemTitle)
                            }
                        )
                    }
                }
            )
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: getTabItemImageSize * 2,
                maxHeight: getTabItemImageSize * 2,
                alignment: .center
            )
            .background(Color.clear)
        }
    }
}
