//
//  CryptoCurrency.swift
//  CryptoCrazySUI
//
//  Created by Tolga on 5.10.2021.
//

import Foundation

struct CryptoCurrency : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    
    private enum CodingKeys : String, CodingKey {
        
        case currency  = "currency"
        case price = "price"
        
    }
    
    
}
