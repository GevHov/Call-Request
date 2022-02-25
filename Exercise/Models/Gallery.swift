//
//  Gallery.swift
//  Exercise
//
//  Created by Gevorg Hovhannisyan on 21.10.21.
//

import Foundation


//MARK: - Gallery

class Gallery: Codable {
    
    var title: String
    var thumbnailUrl: String
    var contentUrl: String
    var video: [Video]?
    
}
