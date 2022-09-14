//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Sousa on 12/09/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation
import UIKit

class RefeicoesTableViewController: UITableViewController, ViewControllerDelegate {
    
    var refeicoes = [
        Refeicao(nome: "Churros", felicidade: 5),
        Refeicao(nome: "Batata Doce", felicidade: 5),
        Refeicao(nome: "Pao na chapa", felicidade: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        
        cell.textLabel?.text = refeicao.nome
        
        return cell
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passar referencia do controller para outro
        if (segue.identifier == "adicionar"){
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
