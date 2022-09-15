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
    let itens: [Item] = [
        Item(nome: "Molho Pesto", calorias: 13.0),
        Item(nome: "Molho carbonara", calorias: 21.0),
        Item(nome: "Molho pomodoro", calorias: 31.0),
        Item(nome: "Molho WhatsApp", calorias: 31.0),
    ]
    var itensSelecionados: [Item] = []
    
    // MARK: IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: Vie Life cycle
    override func viewDidLoad() {
        let buttonAddItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        
        navigationItem.rightBarButtonItem = buttonAddItem
    }
    
    @objc func adicionarItem(){
        
        let adicionarItensViewController = AdicionarItensViewController()
        
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
        
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let index = indexPath.row
        cell.textLabel?.text = itens[index].nome
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else {return }
        
        let tableRow = indexPath.row
        
        if cell.accessoryType == .none{
            itensSelecionados.append(itens[tableRow])
            cell.accessoryType = .checkmark
        }else{
            let item = itens[tableRow]
            
            guard let position = itensSelecionados.index(of: item) else {return}
            
            itensSelecionados.remove(at: position)
            
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
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
}

