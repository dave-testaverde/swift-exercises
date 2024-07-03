//
//  DetailPaper.swift
//  BiBrowser
//

import SwiftUI

struct DetailPaper: View {
    var pubblicazione: Paper
    
    var body: some View {
        ScrollView {
            
            Background()
            
            Preview(image: pubblicazione.image)
                .offset(y: -110)
                .padding(.bottom, -110)
            
            VStack (alignment: .leading)
            {
                Text (pubblicazione.title)
                    .font(.title)
                    .foregroundColor(Color.green)
                
                HStack {
                    Text(pubblicazione.author)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(String(pubblicazione.year))
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            }
            .padding()
            
            Spacer()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
    
}

#Preview {
    DetailPaper(pubblicazione: pubblicazioni[3])
}
