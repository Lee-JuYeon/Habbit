//
//  CustomTabBottomItem.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

struct CustomTabBottomItem: View {
    
    private var model : CustomTabItemModel
    @Binding private var currentItem: String
    private var getParentHeight : CGFloat
    private var getItemClicked : (String) -> Void

    
    init(
        setModel : CustomTabItemModel,
        setCurrentItem : Binding<String>,
        setTabItemImageSize : CGFloat,
        setItemCliekd : @escaping (String) -> Void
    ){
        self.model = setModel
        self._currentItem = setCurrentItem
        self.getParentHeight = setTabItemImageSize
        self.getItemClicked = setItemCliekd
    }
    
    @Environment(\.colorScheme) private var scheme
    var body: some View {
        VStack(
            alignment : HorizontalAlignment.center,
            spacing: 0
        ){
            Image(model.image)
                .resizable()
                .renderingMode(.template)
                .foregroundColor( model.title == currentItem ? (scheme == .dark ? Color.white : Color.black) : Color.gray)
                .frame(
                    width: getParentHeight / 2,
                    height: getParentHeight / 2
                )
                
            
//            Spacer().frame(height: 4)
            
            Text(LocalizedStringKey(model.title))
                .foregroundColor(
//                    model.title == currentItem ? Theme.customTabItemColour(forScheme: scheme) : Theme.customTabItemColour(forScheme: scheme)
                    model.title == currentItem ? (scheme == .dark ? Color.white : Color.black) : Color.gray
                )
                .font(.system(
                    size: getParentHeight / 2,
                    weight: model.title == currentItem ? .bold : .light
                ))
            
        }
        .frame(
            height:getParentHeight
        )
        .onTapGesture {
            currentItem = model.title
            getItemClicked(currentItem)
        }
    }
}
