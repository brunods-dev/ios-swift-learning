//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 23/02/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["Molho Pesto", "Molho carbonara", "Molho de tomate"]
    
    // MARK: IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let index = indexPath.row
        cell.textLabel?.text = itens[index]
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else {return }
        
        if cell.accessoryType == .none{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
    }
    
    // MARK: IBAction
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
}

