//
//  DropDownView.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI

enum DropDownState {
    case top
    case bottom
}

struct DropDownView: View {
    
    private var getTitle: String
    private var getList: [String]
    private var getOutput : (String) -> ()
    
    init(
        setTitle: String,
        setList: [String],
        setOutput : @escaping (String) -> ()
    ) {
        self.getTitle = setTitle
        self.getList = setList
        self.getOutput = setOutput
    }
    
    var maxWidth: CGFloat = 180
    
    var state: DropDownState = .bottom
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                
                
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Text(getTitle == nil ? "Select" : getTitle)
                        .foregroundColor(getTitle != nil ? .black : .gray)
                    
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: 180, height: 50)
                .background(.white)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray)
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
            
        }
        .frame(width: maxWidth, height: 50)
        .zIndex(zindex)
    }
    
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(getList, id: \.self) { option in
                HStack {
                    Text(option)
                    
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(getTitle == option ? 1 : 0)
                }
                .foregroundStyle(getTitle == option ? Color.primary : Color.gray)
                .animation(.none, value: getTitle)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        getOutput(option)
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
