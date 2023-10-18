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
        Text("\(colorPalette.palette_name)")
        List {
            ForEach(colorPalette.palette_colors, id: \.sort_order) { color in
                Text("\(color.sort_order)")
                Text("\(color.description)")
                Text("Color (red: \(color.red), green:\(color.green), blue:\(color.blue)")
            }
        }
    }
}

#Preview {
    ColorPaletteView()
}
