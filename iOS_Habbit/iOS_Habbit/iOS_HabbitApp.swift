//
//  iOS_HabbitApp.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 5/31/24.
//

import SwiftUI

@main
struct iOS_HabbitApp: App {

    @StateObject private var bottomSheetVM = CustomBottomSheetVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bottomSheetVM)
        }
    }
}

/*
 상수로 선언된 프로퍼티는 초기화 이후에는 값이 변경될 수 없습니다. 그러나 @StateObject는 뷰의 라이프사이클과 관련이 있습니다. SwiftUI는 뷰가 다시 그려질 때마다 @StateObject가 연결된 객체를 재생성하고 초기화합니다. 이것은 상수로 선언된 프로퍼티에는 적합하지 않습니다.

 "SwiftUI는 뷰가 다시 그려질 때마다 @StateObject로 선언된 프로퍼티의 인스턴스를 새로 생성합니다. 이 인스턴스를 상수로 선언된 프로퍼티에 할당하려고 하면 뷰가 다시 그려질 때 이를 재할당할 수 없으므로 상수로 선언된 프로퍼티에는 @StateObject를 사용할 수 없습니다".

 따라서 @StateObject로 선언된 프로퍼티는 객체가 뷰의 생명주기와 함께 적절하게 관리되도록 변수로 선언되어야 합니다. 변수로 선언된 @StateObject 프로퍼티는 뷰가 다시 그려질 때마다 해당 객체의 새 인스턴스를 생성하고 할당할 수 있습니다.
 */
