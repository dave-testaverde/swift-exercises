//
//  ListPaper.swift
//  BiBrowser
//

import SwiftUI

struct ListPaper: View {
    var body: some View {
        
        NavigationSplitView {
            List (pubblicazioni) {pubblicazione in
                
                NavigationLink {
                    DetailPaper(pubblicazione: pubblicazione)
                } label: {
                SingleElem(pubblicazione: pubblicazione)
            }
            }
            .navigationTitle("Pubblicazioni")
        }
    detail: {Text("Scegli una Pubblicazione")
    }
    }
}

#Preview {
    ListPaper()
}
