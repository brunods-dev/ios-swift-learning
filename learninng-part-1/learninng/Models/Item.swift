//
//  Item.swift
//  learninng
//
//  Created by Bruno Sousa on 11/09/22.
//

import UIKit

class Item: NSObject {
    
    let nonme: String
    let calorias: Double
    
    init(nome:String, calorias:Double) {
        self.nonme = nome
        self.calorias = calorias
    }

}
