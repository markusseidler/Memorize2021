//
//  GroupPreView.swift
//  Memorize2021
//
//  Created by Markus Seidler on 12/1/21.
//

import SwiftUI

//https://stackoverflow.com/questions/56938805/how-to-pass-one-swiftui-view-as-a-variable-to-another-view-struct

struct GroupPreview<Content: View>: View {
    private var baseView: Content
    
    init(@ViewBuilder baseView: @escaping () -> Content) {
        self.baseView = baseView()
    }
    
    var body: some View {
        Group {
            baseView
                .previewDevice(PreviewDevice(rawValue: Devices.twelveProMax.rawValue))
                .previewDisplayName(Devices.twelveProMax.rawValue)
            
            baseView
                .previewDevice(PreviewDevice(rawValue: Devices.twelvePro.rawValue))
                .previewDisplayName(Devices.twelvePro.rawValue)
            
            baseView
                .previewDevice(PreviewDevice(rawValue: Devices.eight.rawValue))
                .previewDisplayName(Devices.eight.rawValue)
            
            baseView
                .previewDevice(PreviewDevice(rawValue: Devices.se.rawValue))
                .previewDisplayName(Devices.se.rawValue)
        }
    }
}

