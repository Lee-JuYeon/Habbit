//
//  CustomTabView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

/*
 사용 예제
 CustomTabView(
     setTabItemModels: CustomTabItemModel.CustomTabItemModelList,
     setSelectedIndex: $selectedIndex) { page in
         switch page {
         case 0:
             FirstView()
         case 1 :
             ProfileView()
         default:
             FirstView()
     }
 }
}
 */

struct CustomTabView<Content: View>: View {
    
    private var getTabItemModels: [CustomTabItemModel]
    @Binding var getSelectedIndex: Int
    @ViewBuilder let getContent: (Int) -> Content
    @Environment(\.colorScheme) private var scheme

    init(
        setTabItemModels: [CustomTabItemModel],
        setSelectedIndex: Binding<Int>,
        @ViewBuilder setContent: @escaping (Int) -> Content
    ) {
        self.getTabItemModels = setTabItemModels
        self._getSelectedIndex = setSelectedIndex
        self.getContent = setContent
    }
    
   
    var body: some View {
        VStack(
            alignment : HorizontalAlignment.center,
            spacing: 0
        ) {
            TabView(
                selection: $getSelectedIndex
            ) {
                ForEach(getTabItemModels.indices, id: \.self) { index in
                    getContent(index)
                        .tag(index)
                }
            }
            .background(Color.clear)
            
            CustomTabBottom(
                setTabItemModels: getTabItemModels,
                setTabItemImageSize: 25,
                setItemCliekd: { clickedItemTitle in
                    if let index = CustomTabItemModel.CustomTabItemModelList.firstIndex(
                        where: { $0.title == clickedItemTitle }) {
                            getSelectedIndex = index
                        } else {
                            getSelectedIndex = 0
                    }
                }
            )
        }
    }
}

