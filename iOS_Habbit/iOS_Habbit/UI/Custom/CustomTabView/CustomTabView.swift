//
//  CustomTabView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
    private var getTabItemModels: [CustomTabItemModel]
    private var getTabViewStyle: CustomTabViewStyle
    private var getTabBackgroundColour : Color
    @Binding var getSelectedIndex: Int
    @ViewBuilder private let getContent: (Int) -> Content

    init(
        setTabViewStyle: CustomTabViewStyle,
        setTabBackgroundColour : Color,
        setTabItemModels: [CustomTabItemModel],
        setSelectedIndex: Binding<Int>,
        @ViewBuilder setContent: @escaping (Int) -> Content
    ) {
        self.getTabItemModels = setTabItemModels
        self.getTabBackgroundColour = setTabBackgroundColour
        self._getSelectedIndex = setSelectedIndex
        self.getContent = setContent
        self.getTabViewStyle = setTabViewStyle
    }
    
    @Environment(\.colorScheme) private var scheme
    var body: some View {
        GeometryReader{ geo in
            let screenWidth = geo.size.width
            let screenHeight = geo.size.height
            VStack(
                alignment : HorizontalAlignment.center,
                spacing: 0
            ) {
                TabScreenView(geo: geo)
                TabNavigationView(geo: geo)
            }
            .background(.clear)
        }
       
    }
    
    private func TabScreenView(geo : GeometryProxy) -> some View {
        return getContent(getSelectedIndex)
            .frame(
                height: (geo.size.height / 20) * 19
            )
    }
    
    private func TabNavigationView(geo : GeometryProxy) -> some View {
        return VStack{
            Rectangle()
                .fill()
                .background(.black)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: 1
                )
            LazyHStack(
                alignment : VerticalAlignment.center,
                content: {
                    ForEach(getTabItemModels, id: \.self) { model in
                        
//                        if let index = getTabItemModels.firstIndex( where: { $0.title == clickedItemTitle }) {
//                            getSelectedIndex = index
//                        } else {
//                            getSelectedIndex = 0
//                        }
                        
                        TabItemView(setTitle: model.title, setImage: model.image)
                   }
                }
            )
        }
        .background(getTabBackgroundColour)
        .frame(
            width : UIScreen.main.bounds.width,
            height: (geo.size.height / 20) * 1
        )
    }
    
    private func TabItemView(setTitle getTitle : String, setImage getImage : String) -> some View {
        return VStack(alignment : HorizontalAlignment.center){
            Text(getTitle)
        }
    }
   
//    var body: some View {
//        GeometryReader{ geo in
//            let screenWidth = geo.size.width
//            let screenHeight = geo.size.height
//            VStack(
//                alignment : HorizontalAlignment.center,
//                spacing: 0
//            ) {
//                switch(getTabViewStyle){
//                case .BottomNavigation :
//                    getContent(getSelectedIndex)
//                        .background(getTabBackgroundColour)
//                        .frame(
//                            width: screenWidth,
//                            height: (geo.size.height / 20) * 19
//                        )
//                    CustomTabBottom(
//                        setParentHeight: (geo.size.height / 20) * 1, 
//                        setTabBackgroundColour: getTabBackgroundColour,
//                        setTabItemModels: getTabItemModels,
//                        setItemCliekd: { clickedItemTitle in
//                            if let index = getTabItemModels.firstIndex(
//                                where: { $0.title == clickedItemTitle }) {
//                                getSelectedIndex = index
//                            } else {
//                                getSelectedIndex = 0
//                            }
//                        }
//                    )
//                    .frame(
//                        width: geo.size.width,
//                        height: (geo.size.height / 20) * 1
//                    )
//                case .TabView :
//                    CustomTabBottom(
//                        setParentHeight: (geo.size.height / 20) * 1,
//                        setTabBackgroundColour: getTabBackgroundColour,
//                        setTabItemModels: getTabItemModels,
//                        setItemCliekd: { clickedItemTitle in
//                            if let index = getTabItemModels.firstIndex(
//                                where: { $0.title == clickedItemTitle }) {
//                                getSelectedIndex = index
//                            } else {
//                                getSelectedIndex = 0
//                            }
//                        }
//                    )
//                    .frame(
//                        width: geo.size.width,
//                        height: (geo.size.height / 20) * 1
//                    )
//                    
//                    getContent(getSelectedIndex)
//                        .frame(
//                            width: geo.size.width,
//                            height: (geo.size.height / 20) * 19
//                        )
//                        .background(getTabBackgroundColour)
//
//                }
//            }
//            .background(.clear)
//        }
//    }
}

