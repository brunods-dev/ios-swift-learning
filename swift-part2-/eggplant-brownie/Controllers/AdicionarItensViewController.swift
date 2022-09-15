//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Sousa on 14/09/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriaTextField: UITextField!
    
    // MARK: Atributos
    
    var delegate: AdicionaItensDelegate?

    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let caloriaString = caloriaTextField.text else { return }
        
        guard let caloria = Double(caloriaString) else {return}
        
        let item = Item(nome: nome, calorias: caloria)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }

}
