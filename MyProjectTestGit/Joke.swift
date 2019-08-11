//
//  Joke.swift
//  MyProjectTestGit
//
//  Created by Z64me on 9/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation

struct Joke: Codable { // Codable = Encodable + Decodable
    //  let id: String
    //  let value: String
    let appeared_at: String
    let tags:[String]
    //   let I1:String
    //  let iconURL: String
    //  let url: String
    
    //    let sourceUnit : String
    //    let sourceAmount: String
    //    let ingredientName: Double
    //    let targetUnit: String
    
    private enum CodingKeys: String, CodingKey {
        //    case id
        //    case value
        case appeared_at
        case tags
        // case I1 = "3"
        //    case url
        //    case iconURL = "icon_url"
        //    case sourceUnit
        //     case sourceAmount
        //     case ingredientName
        //     case targetUnit
        
        
    }
}
