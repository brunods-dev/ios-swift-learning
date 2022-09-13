//
//  ViewController.swift
//  learninng
//
//  Created by Bruno Sousa on 29/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeInput:UITextField?
    @IBOutlet var felicidadeInput:UITextField?


    @IBAction func onPressButton(_ sender: Any) {
        
        // Resolvendo com IF LET
        if let nome = nomeInput?.text, let felicidade = felicidadeInput?.text {

            if let felicidadeInt = Int(felicidade){
                
                let refeicao = Refeicao(nome: nome, felicidade: felicidadeInt)
                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
            }else {
                print("Erro ao converter String para Int")
            }
        }else{
            print("Valores nil")
        }
        
        
        // RESOLVENDO COM GUARD LET
        guard let nomeRefeicao = nomeInput?.text else {
            return
        }
        guard let felicidadeRefeicao = felicidadeInput?.text, let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
    }
}

