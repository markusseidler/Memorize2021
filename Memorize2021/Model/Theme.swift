//
//  EmojiTheme.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

struct Theme: Identifiable, Codable {
    var name: String
    var icons: [String]
    var color: String
    var numbersOfCards: Int { icons.count }
    var id = UUID()
}
