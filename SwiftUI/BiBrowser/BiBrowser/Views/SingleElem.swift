//
//  SingleElem.swift
//  BiBrowser
//

import SwiftUI

struct SingleElem: View {
    
    var pubblicazione: Paper
    
    var body: some View {
        HStack {
            pubblicazione.image
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            Text(pubblicazione.title)
            
            Spacer()
        }
    }
}

#Preview {
    Group {
        SingleElem(pubblicazione: pubblicazioni[4])
        SingleElem(pubblicazione: pubblicazioni[3])
    }
}
