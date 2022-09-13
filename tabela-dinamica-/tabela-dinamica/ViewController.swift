//
//  ViewController.swift
//  tabela-dinamica
//
//  Created by Bruno Sousa on 12/09/22.
//

import UIKit

class ViewController: UITableViewController {

    let refeicoes: Array<String> = ["churros", "pizza", "salada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("TableView Carregada ! ")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        return celula
    }
}

