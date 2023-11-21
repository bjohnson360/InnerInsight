//
//  Quotes.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/20/23.
//

import Foundation

struct QuoteAPIResponse: Codable {
    let q: String
    let a: String
    
}
struct Quotes: Decodable {
    let q: String
    let a: String
   
    
    private enum CodingKeys: String, CodingKey {
        case q = "q" //quote
        case a = "a" //author
        
    }
}
