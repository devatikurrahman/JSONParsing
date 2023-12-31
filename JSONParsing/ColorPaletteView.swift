//
//  ColorPaletteView.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/18/23.
//

import SwiftUI

struct ColorPaletteView: View {
    private let colorPalette: ColorPalette = ColorPalette.colorPalette
    
    var body: some View {
        Text("\(colorPalette.name)")
        List {
            ForEach(colorPalette.colors, id: \.order) { color in
                Text("\(color.order)")
                Text("\(color.description)")
                Text("Color (red: \(color.red), green:\(color.green), blue:\(color.blue)")
            }
        }
    }
}

#Preview {
    ColorPaletteView()
}
