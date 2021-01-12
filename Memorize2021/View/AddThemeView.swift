//
//  AddThemeView.swift
//  Memorize2021
//
//  Created by Markus Seidler on 12/1/21.
//

import SwiftUI

struct AddThemeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var themes: EmojiThemes
    
    @State private var themeName: String = ""
    @State private var themeIcons: String = ""
    @State private var themeColor: ThemeColors  = ThemeColors.red
    
    enum ThemeColors: String, CaseIterable {
        case black
        case blue
        case gray
        case green
        case orange
        case pink
        case purple
        case red
        case yellow
        case white
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter the name of your theme", text: $themeName)
                }
                Section(header: Text("Icons")) {
                    TextField("Type the theme icons without comma", text: $themeIcons)
                }
                Section(header: Text("Color")) {
                    Picker(selection: $themeColor, label: Text("Picker")){
                        ForEach(ThemeColors.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                Button(action: {
                    saveTheme()
                }, label: {
                    Text("Save new theme")
                })
            }
            .navigationTitle("Add new theme")
        }
    }
    
    private func saveTheme() {
        themes.addNewTheme(Theme(name: themeName, icons: themeIcons.map { String ($0) }, color: themeColor.rawValue))
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddThemeView_Previews: PreviewProvider {
    static var previews: some View {
        AddThemeView()
    }
}
