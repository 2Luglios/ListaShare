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
    
    var lista:Lista!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (lista.shared?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "celula")
        
        let compartilhamentos = lista.shared?.allObjects as! [Compartilhamento]
        
        let compartilhamento = compartilhamentos[indexPath.row]
        
        cell.textLabel?.text = compartilhamento.nome
        cell.detailTextLabel?.text = compartilhamento.email
        
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
            
            let dao = Dao<Compartilhamento>()
            let compartilhamento = dao.new()
            compartilhamento.nome = alerta.textFields?[0].text
            compartilhamento.email = alerta.textFields?[1].text
            
            self.lista.addToShared(compartilhamento)
            dao.saveContext()

            self.tableView.reloadData()
        }))
        
        alerta.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        navigationController?.present(alerta, animated: true, completion: nil)
    }
    
}
