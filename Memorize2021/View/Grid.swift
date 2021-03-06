//
//  Grid.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
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

    private func bodyWithGridLayout(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
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

}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}

