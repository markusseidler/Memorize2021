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
                                destination: Text("\(theme.name)")) {
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
    
    enum Devices: String {
        case twelveProMax = "iPhone 12 Pro Max"
        case twelvePro = "iPhone 12 Pro"
        case eight = "iPhone 8"
        case se = "iPhone SE"
    }
    
    
    static var previews: some View {
        Group {
            StartView()
                .previewDevice(PreviewDevice(rawValue: Devices.twelveProMax.rawValue))
                .previewDisplayName(Devices.twelveProMax.rawValue)
            
            StartView()
                .previewDevice(PreviewDevice(rawValue: Devices.twelvePro.rawValue))
                .previewDisplayName(Devices.twelvePro.rawValue)
            
            StartView()
                .previewDevice(PreviewDevice(rawValue: Devices.eight.rawValue))
                .previewDisplayName(Devices.eight.rawValue)
            
            StartView()
                .previewDevice(PreviewDevice(rawValue: Devices.se.rawValue))
                .previewDisplayName(Devices.se.rawValue)
        }
    }
}
