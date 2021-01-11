//
//  EmojiThemes.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

struct EmojiThemes {
    
    var all = [Theme]()
    
    init() {
        all.append(EmojiThemes.animal)
    }
    
    mutating func addNewTheme(_ theme: Theme) {
        all.append(theme)
    }
    
    private static let animal = Theme(
        name: "Animal",
        icons: ["🐶", "🐴", "🐰", "🐮", "🐼", "🦁", "🐯", "🐵"],
        themeColor: Color.green)
    
    private static let flags = Theme(
        name: "Flags",
        icons: ["🇩🇪", "🇦🇹", "🇸🇽", "🇸🇬", "🇨🇳", "🇺🇸", "🇪🇺", "🇺🇳"],
        themeColor: Color.blue)
    
    private static let fruits = Theme(
        name: "Fruits",
        icons: ["🍓", "🍌", "🍇", "🍉", "🥝", "🫐", "🍏", "🍒"],
        themeColor: Color.yellow)
    
    private static let halloween = Theme(
        name: "Halloween",
        icons: ["👻", "🕸", "🕷", "🎃", "💀", "🧙‍♀️", "🧛‍♂️", "🍬"],
        themeColor: Color.orange)
    
    private static let sports = Theme(
        name: "Sports",
        icons: ["⚽️", "🏀", "🎾", "🎱", "🏐", "🏈", "🥏", "⚾️"],
        themeColor: Color.red)
    
    private static let smileys = Theme(
        name: "Smileys",
        icons: ["😀", "😁", "☺️", "😇", "😍", "😘", "😉", "🤪"],
        themeColor: Color.black)
    
}
