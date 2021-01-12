//
//  EmojiThemes.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

class EmojiThemes: ObservableObject {
    
    @Published var all = [Theme]()
    
    init() {
        
        if let data = UserDefaults.standard.data(forKey: saveKeyForThemes) {
            if let decoded = try? JSONDecoder().decode(Array<Theme>.self, from: data) {
                all = decoded
            }
        } else {
            all = [EmojiThemes.animal, EmojiThemes.flags, EmojiThemes.fruits, EmojiThemes.halloween, EmojiThemes.sports, EmojiThemes.smileys]
        }
    }
    
    func addNewTheme(_ theme: Theme) {
        all.append(theme)
        saveTheme()
    }
    
//    func removeTheme(_ theme: Theme) {
//        if let matchingIndex = all.firstIndex(matching: theme) {
//            all.remove(at: matchingIndex)
//        }
//        saveTheme()
//    }
    
    func removeTheme(at offsets: IndexSet) {
        all.remove(atOffsets: offsets)
        saveTheme()
    }
    
    private func saveTheme() {
        if let encoded = try? JSONEncoder().encode(all) {
            UserDefaults.standard.set(encoded, forKey: saveKeyForThemes)
        }
    }
    
    private let saveKeyForThemes = "EmojiThemes"
    
    private static let animal = Theme(
        name: "Animal",
        icons: ["🐶", "🐴", "🐰", "🐮", "🐼", "🦁", "🐯", "🐵"],
        color: "green")
    
    private static let flags = Theme(
        name: "Flags",
        icons: ["🇩🇪", "🇦🇹", "🇸🇽", "🇸🇬", "🇨🇳", "🇺🇸", "🇪🇺", "🇺🇳"],
        color: "blue")
    
    private static let fruits = Theme(
        name: "Fruits",
        icons: ["🍓", "🍌", "🍇", "🍉", "🥝", "🫐", "🍏", "🍒"],
        color: "yellow")
    
    private static let halloween = Theme(
        name: "Halloween",
        icons: ["👻", "🕸", "🕷", "🎃", "💀", "🧙‍♀️", "🧛‍♂️", "🍬"],
        color: "orange")
    
    private static let sports = Theme(
        name: "Sports",
        icons: ["⚽️", "🏀", "🎾", "🎱", "🏐", "🏈", "🥏", "⚾️"],
        color: "red")
    
    private static let smileys = Theme(
        name: "Smileys",
        icons: ["😀", "😁", "☺️", "😇", "😍", "😘", "😉", "🤪"],
        color: "black")
    
    func getColorFromString(_ name: String) -> Color {
        switch name {
        case "black":
            return Color.black
        case "blue":
            return Color.blue
        case "gray":
            return Color.gray
        case "green":
            return Color.green
        case "orange":
            return Color.orange
        case "pink":
            return Color.pink
        case "purple":
            return Color.purple
        case "red":
            return Color.red
        case "yellow":
            return Color.yellow
        default:
            return Color.black
    }
    
    }
    
}
