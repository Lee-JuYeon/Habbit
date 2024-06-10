//
//  CustomTabBottom.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct CustomTabBottom: View {
    
    private var getTabItemModels: [CustomTabItemModel]
    private var getTabBackgroundColour : Color
    private var getItemClicked: (String) -> Void
    private var getParentHeight : CGFloat
    @Environment(\.colorScheme) private var scheme
    @State private var currentItem: String
    
    init(
        setParentHeight : CGFloat,
        setTabBackgroundColour : Color,
        setTabItemModels: [CustomTabItemModel],
        setItemCliekd: @escaping (String) -> Void
    ) {
        self.getParentHeight = setParentHeight
        self.getTabBackgroundColour = setTabBackgroundColour
        self.getTabItemModels = setTabItemModels
        self.getItemClicked = setItemCliekd
        self._currentItem = State(initialValue: setTabItemModels.first?.title ?? "tab_mates")
    }
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(
                alignment: .center,
                content: {
                    ForEach(getTabItemModels, id : \.self){ model in
                        CustomTabBottomItem(
                            setModel: model,
                            setCurrentItem: $currentItem,
                            setTabItemImageSize: ((getParentHeight/10) * 8) - 2,
                            setItemCliekd: { clickedItemTitle in
                                getItemClicked(clickedItemTitle)
                            }
                        )
                        .frame(width: UIScreen.main.bounds.width / CGFloat(getTabItemModels.count))
                    }
                }
            )
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: getParentHeight,
            maxHeight: getParentHeight,
            alignment: .center
        )
        .background(getTabBackgroundColour.opacity(0.6))
    }
}
