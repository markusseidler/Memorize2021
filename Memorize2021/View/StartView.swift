//
//  StartView.swift
//  Memorize2021
//
//  Created by Markus Seidler on 11/1/21.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var themes = EmojiThemes()
    
    @State private var addThemeViewIsPresented: Bool = false
    
    private var allThemes: [Theme] { themes.all }
    
    var body: some View {
        NavigationView {                                    
                VStack {
                    List {
                        Text("Select your theme")
                        ForEach(allThemes) { theme in
                            NavigationLink(
                                // TODO: - Start Game based on selected theme
                                destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(gameTheme: theme), themeColor: themes.getColorFromString(theme.color), themeName: theme.name)) {
                                VStack(alignment: .leading) {
                                    Text(theme.name).foregroundColor(themes.getColorFromString(theme.color))
                                    Text("\(theme.icons.joined())")
                                }
                            }
                        }
                        .onDelete(perform: { indexSet in
                            themes.removeTheme(at: indexSet)
                        })
                    }
                }
                .sheet(isPresented: $addThemeViewIsPresented, content: {
                    AddThemeView()
                })
                .navigationTitle("Memorize")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: { addThemeViewIsPresented = true }, label: { Text("Add theme")} ))
        }
        .environmentObject(themes)
    }
}

struct StartView_Previews: PreviewProvider {
    
    static var previews: some View {
        GroupPreview { StartView() }
    }
}
