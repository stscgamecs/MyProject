//
//  Joke.swift
//  MyProjectTestGit
//
//  Created by Z64me on 9/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation

struct Joke: Codable {
    
    let appeared_at: String
    let tags:[String]
 
    
    private enum CodingKeys: String, CodingKey {
        case appeared_at
        case tags
    }
}
