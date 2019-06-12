//
//  SearchResult.swift
//  iTunesSearch
//
//  Created by Enayatullah Naseri on 6/11/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    
    var title: String?
    var creator: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
        
    }
    
}

struct SearchResults: Codable {
    
    let results: [SearchResult]
    
}
