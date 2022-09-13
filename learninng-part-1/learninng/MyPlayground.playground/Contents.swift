import UIKit


// Criar uma clase que agrupe essas caracteristicas

class Refeicao {
    
    // Atributos
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    // Construtor
    init(nome:String, felicidade: String){
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

class Item {
    var nonme: String
    var calorias: Double
    
    
    init(nome:String, calorias:Double) {
        self.nonme = nome
        self.calorias = calorias
    }
    

}

let refeicao = Refeicao(nome: "Almoço", felicidade: "5")

let arroz = Item(nome: "Arroz", calorias: 51.2)
let feijao = Item(nome: "Feijao", calorias: 90)
let contraFile = Item(nome: "Contra file", calorias: 251.2)

refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

print(refeicao.totalDeCalorias())
