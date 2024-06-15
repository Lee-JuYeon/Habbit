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
                
//                if let index = getTabItemModels.firstIndex( where: { $0.title == clickedItemTitle }) {
//                    getSelectedIndex = index
//                } else {
//                    getSelectedIndex = 0
//                }
                
                getContent(getSelectedIndex)
                    .frame(
                        height: (geo.size.height / 20) * 19
                    )
                
                VStack{
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
                            ForEach(1...2, id: \.self) { count in
                                Text("Placeholder ")
                                   
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
            .background(.clear)
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

