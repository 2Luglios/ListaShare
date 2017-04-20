//
//  ListaProdutoTableViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class ListaProdutoTableViewController: UITableViewController, CadastraProdutoDelegate {
    
    var produtos:[Produto] = []
    
    var delegate:GravaNaListaDelegate!
    
    override func viewDidLoad() {
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! ProdutoCustomCell
        
        let produto = produtos[indexPath.row]
        
        cell.marcaLabel.text = produto.marca
        cell.checkBoxImageView.image = produto.checado ? #imageLiteral(resourceName: "checkOn") : #imageLiteral(resourceName: "checkOff")
        cell.imagemImageView.image = produto.imagem as? UIImage
        cell.nomeProdutoLabel.text = produto.nome
        cell.obsTextView.text = produto.obs
        cell.opcionalLabel.text = produto.opcional
        
        cell.imagemImageView.tag = indexPath.row
        let tap = UITapGestureRecognizer(target: ListaProdutoTableViewController.self, action: #selector(marcarOuDesmarcar))
        tap.numberOfTapsRequired = 1
        cell.imagemImageView.addGestureRecognizer(tap)
        
        return cell
    }
    
    func marcarOuDesmarcar() {
        print("marcar ou não")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAddProduto" {
            let dest = segue.destination as! CadastroProdutoViewController
            dest.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produtos.count
    }
    
    func adicionaProduto(_ prod:Produto) {
        produtos.append(prod)
        delegate.gravarProdutoNaLista(prod)
        tableView.reloadData()
    }
    
}
