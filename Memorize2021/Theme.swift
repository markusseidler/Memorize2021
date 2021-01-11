//
//  EmojiTheme.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

struct Theme {
    var name: String
    var icons: [String]
    var themeColor: Color
    var numbersOfCards: Int {
        icons.count
    }
}
