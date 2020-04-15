//
//  Card.swift
//  Concentration
//
//  Created by Pavel Ronaldo on 4/12/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp =  false
    var isMatched = false
   private var identifier: Int
    
   private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
        
    }
}
