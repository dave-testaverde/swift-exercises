//
//  Paper.swift
//  BiBrowser
//

import Foundation
import SwiftUI

struct Paper: Hashable, Codable, Identifiable {
    var id: Int
    var type: String
    var author: String
    var journal: String
    var publisher: String
    var title: String
    var volume: String
    var year: Int
    var file: String
    
    private var preview: String
    var image: Image {
        Image(preview)
    }
}
