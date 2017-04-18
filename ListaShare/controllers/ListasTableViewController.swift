//
//  ListasTableViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class ListasTableViewController: UITableViewController {
    
    var lista:[Lista] = []
    
    override func viewDidLoad() {
        lista = Dao<Lista>().list()
    }
    
    @IBAction func voltar () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "grupos")
        
        present(view, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! ListaCustomCell
        
        cell.nomeListaLabel.text = lista[indexPath.row].nome
        
        cell.shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "listaProdutos")
        
       // view.produtos = lista[indexPath.row].produtos?.allObjects as! [Produto]
        
        navigationController?.present(view, animated: true, completion: nil)
        
    }
    
    func share() {
        print("share")
    }
    
    @IBAction func adicionarLista(_ sender: Any) {
        let alerta = UIAlertController(title: "Adicionar...", message: "Digite o nome da lista a adicionar:", preferredStyle: .alert)
        
        alerta.addTextField(configurationHandler: nil)
        
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (UIAlertAction) in
            let dao = Dao<Lista>()
            let lista = dao.new()
            lista.nome = alerta.textFields?[0].text
            dao.saveContext()
            
            self.lista = Dao<Lista>().list()
            
            self.tableView.reloadData()
        }))
        
        alerta.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        navigationController?.present(alerta, animated: true, completion: nil)
        
    }
}
