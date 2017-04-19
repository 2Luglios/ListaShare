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
    
    var listas:[Lista] = []
    
    override func viewDidLoad() {
        listas = Dao<Lista>().list()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! ListaCustomCell
        
        cell.nomeListaLabel.text = listas[indexPath.row].nome
        
//        cell.shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        cell.shareButton.tag = indexPath.row
        
        return cell
    }
    
//    func share() {
//        print("share")
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueListaProdutos" {
            let listaProdutos = segue.destination as! ListaProdutoTableViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let listaSelecionada = listas[indexPath.row]
            
            listaProdutos.lista = listaSelecionada
        }
        if segue.identifier == "segueAddCompartilhamento" {
            let listaProdutos = segue.destination as! ShareTableViewController
            
            let btn = sender as! UIButton
            let listaSelecionada = listas[btn.tag]
            print("share \(btn.tag)")
            
            listaProdutos.lista = listaSelecionada
        }
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
            
            self.listas = Dao<Lista>().list()
            
            self.tableView.reloadData()
        }))
        
        alerta.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        navigationController?.present(alerta, animated: true, completion: nil)
        
    }
}
