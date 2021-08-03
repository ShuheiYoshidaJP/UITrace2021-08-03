//
//  ContentView.swift
//  UITrace2021年8月3日
//
//  Created by 吉田周平 on 2021/08/03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            PagingView(index: $viewModel.index, maxIndex: viewModel.images.count - 1) {
                ForEach(viewModel.images, id: \.id) { imageData in
                    Image(imageData.image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
            Text(viewModel.selectItem.name)
                .padding(.leading)
            Text("\(viewModel.selectItem.fee)円")
                .padding(.leading)
            Text("Color(\(viewModel.selectItem.colors.count)): \(viewModel.selectItem.selectColor.description)")
                .padding(.leading)
            HStack {
                ForEach(viewModel.selectItem.colors, id: \.self) {color in
                    Circle()
                        .fill(color)
                        .frame(width: 40,height: 40)
                }
            }
            .padding(.leading)
            Spacer()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Button")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .frame(maxWidth: .infinity)
                })
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ItemData {
    var image: String
    var id: UUID
    var name: String
    var fee: Int
    var colors: [Color]
    var selectedColorIndex: Int = 0
    var selectColor: Color {
        return colors[selectedColorIndex]
    }
}

class ContentViewModel: ObservableObject {
    var selectItem: ItemData {
        return images[index]
    }
    
    var images = [
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow]),
        ItemData(image: "bug",
                 id: UUID(),
                 name: "Mini Lether Zip Olympia Bag",
                 fee: 1000,
                 colors: [.black, .red, .yellow])
    ]
    @Published var index = 0
}
