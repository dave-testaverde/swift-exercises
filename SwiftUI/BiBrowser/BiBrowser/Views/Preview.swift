//
//  Preview.swift
//  BiBrowser
//

import SwiftUI

struct Preview: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 200, height: 320)
            .clipShape(Rectangle())
            .overlay {
                Rectangle().stroke(.green, lineWidth: 4)
            }
            .shadow(radius: 10)
    }
}

#Preview {
    Preview(image: Image("4"))
}
