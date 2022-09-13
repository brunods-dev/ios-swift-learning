//
//  Refeicao.swift
//  learninng
//
//  Created by Bruno Sousa on 11/09/22.
//

import UIKit

class Refeicao: NSObject {
    
    // Atributos
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    // Construtor
    init(nome:String, felicidade: Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total: Double = 0.0
        
        for item in self.itens{
            total += item.calorias
        }
        return total
    }
    

}
