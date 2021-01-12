//
//  Array+Only.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
