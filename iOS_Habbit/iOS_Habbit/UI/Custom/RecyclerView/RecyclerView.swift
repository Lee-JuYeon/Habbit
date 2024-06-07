//
//  RecyclerView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

enum RecyclerViewAxis {
    case HORIZONTAL, VERTICAL
}

struct RecyclerView<GetViewHolders : View>: View {
    
    private var getAxis : RecyclerViewAxis
    private var getSpacing : CGFloat?
    private var getHorizontalAlignment : HorizontalAlignment
    private var getVerticalAlignment : VerticalAlignment
    @ViewBuilder private var getContent : GetViewHolders
    
    init(
        setAxis : RecyclerViewAxis, // recyclerview의 스크롤 방향
        setSpacing : CGFloat? = 0, // recyclerview의 cell(viewholder)간의 간격을 n만큼 늘린다.
        setHorizontalAlignment : HorizontalAlignment? = HorizontalAlignment.center,
        setVerticalAlignment : VerticalAlignment? = VerticalAlignment.center,
        setContent : @escaping () -> GetViewHolders
    ) {
        self.getContent = setContent()
        self.getAxis = setAxis
        self.getSpacing = setSpacing
        self.getHorizontalAlignment = setHorizontalAlignment ?? HorizontalAlignment.center
        self.getVerticalAlignment = setVerticalAlignment ?? VerticalAlignment.center
    }
    
    var body: some View {
        ScrollView(setScrollAxis(get: getAxis), showsIndicators : false){
            switch getAxis {
            case .VERTICAL :
                LazyVStack(alignment: getHorizontalAlignment, spacing: getSpacing){
                    getContent
                }
            case .HORIZONTAL :
                LazyHStack( alignment: getVerticalAlignment, spacing: getSpacing){
                    getContent
                }
            }
        }
    }
    
    // scrollview의 스크롤 방향을 설정한다.
    private func setScrollAxis(get : RecyclerViewAxis) -> Axis.Set {
        switch get {
        case .VERTICAL :
            return Axis.Set.vertical
        case .HORIZONTAL :
            return Axis.Set.horizontal
        }
    }
}


