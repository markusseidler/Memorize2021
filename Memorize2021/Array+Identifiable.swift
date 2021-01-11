//
//  Array+Identifiable.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import Foundation


extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

