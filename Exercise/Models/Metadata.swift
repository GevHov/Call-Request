//
//  Metadata.swift
//  Exercise
//
//  Created by Gevorg Hovhannisyan on 21.10.21.
//

import Foundation


//MARK: - Metadata

class Metadata: Codable {
    
    var category: String
    var title: String
    var body: String
    var shareUrl: String
    var coverPhotoUrl: String
    var date: Int
    var gallery: [Gallery]?
    
    
}
