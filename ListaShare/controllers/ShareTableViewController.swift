//
//  ShareViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class ShareTableViewController: UITableViewController {
    
    var shareds:[Shared] = []
    var delegate:CadastraSharedDelegate!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shareds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "celula")
        
        let shared = shareds[indexPath.row]
        
        cell.textLabel?.text = shared.nome
        cell.detailTextLabel?.text = shared.email
        
        return cell
    }
    
    @IBAction func addEmail(_ sender: Any) {
        let alerta = UIAlertController(title: "Adicionar...", message: "Digite o nome da lista a adicionar:", preferredStyle: .alert)
        
        alerta.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Digite o nome aqui:"
        })
        alerta.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Digite o email aqui:"
        })
        
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (UIAlertAction) in
            
            let dao = Dao<Shared>()
            let shared = dao.new()
            shared.nome = alerta.textFields?[0].text
            shared.email = alerta.textFields?[1].text
            
            self.delegate.cadastraSharedNaLista(shared)
            self.shareds.append(shared)
            dao.saveContext()

            self.tableView.reloadData()
        }))
        
        alerta.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        navigationController?.present(alerta, animated: true, completion: nil)
    }
    
}
