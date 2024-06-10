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
    private var getTabViewType: CustomTabViewType
    @Binding var getSelectedIndex: Int
    private let getContent: (Int) -> Content

    init(
        setTabViewType: CustomTabViewType,
        setTabItemModels: [CustomTabItemModel],
        setSelectedIndex: Binding<Int>,
        @ViewBuilder setContent: @escaping (Int) -> Content
    ) {
        self.getTabItemModels = setTabItemModels
        self._getSelectedIndex = setSelectedIndex
        self.getContent = setContent
        self.getTabViewType = setTabViewType
    }
    
    @Environment(\.colorScheme) private var scheme
   
    var body: some View {
        VStack(
            alignment : HorizontalAlignment.center,
            spacing: 0
        ) {
            switch(getTabViewType){
            case .BottomNavigation :
                getContent(getSelectedIndex)
                CustomTabBottom(
                    setTabItemModels: getTabItemModels,
                    setTabItemImageSize: 25,
                    setItemCliekd: { clickedItemTitle in
                        if let index = getTabItemModels.firstIndex(
                            where: { $0.title == clickedItemTitle }) {
                            getSelectedIndex = index
                        } else {
                            getSelectedIndex = 0
                        }
                    }
                )
            case .TabView :
                CustomTabBottom(
                    setTabItemModels: getTabItemModels,
                    setTabItemImageSize: 25,
                    setItemCliekd: { clickedItemTitle in
                        if let index = getTabItemModels.firstIndex(
                            where: { $0.title == clickedItemTitle }) {
                            getSelectedIndex = index
                        } else {
                            getSelectedIndex = 0
                        }
                    }
                )
                
                getContent(getSelectedIndex)
            }
        }
    }
}

