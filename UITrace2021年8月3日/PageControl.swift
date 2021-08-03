//
//  PageControl.swift
//  HairStock
//
//  Created by 吉田周平 on 2021/06/20.
//

import SwiftUI

///https://stackoverflow.com/questions/58896661/swiftui-create-image-slider-with-dots-as-indicators

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(15)
    }
}
