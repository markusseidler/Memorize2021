//
//  Grid.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(items) { item in
                bodyWithGridLayout(for: item, in: GridLayout(itemCount: items.count, in: geometry.size))
            }
        }
    }

    func bodyWithGridLayout(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
//                Text("geometry: \(geometry.size.width), \(geometry.size.height)")
//            }
//        }
//    }
//
//    func body(for layout: GridLayout) -> some View {
//        ForEach(items) { item in
//            self.body(for: item, in: layout)
//        }
//    }
//
//    func body(for item: Item, in layout: GridLayout) -> some View {
//        let index = self.index(of: item)
//        return viewForItem(item)
//            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
//            .position(layout.location(ofItemAt: index))
//    }
    
    func index(of item: Item) -> Int {
        for index in 0..<items.count {
            if items[index].id == item.id {
                return index
            }
        }
        return 0
    }
}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
