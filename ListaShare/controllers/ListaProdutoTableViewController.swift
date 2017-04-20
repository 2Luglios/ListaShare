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
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! ProdutoCustomCell
        
        let produto = produtos[indexPath.row]
        
        cell.marcaLabel.text = produto.marca
        //cell.checkBoxImageView.image = produto.checado ?  : #imageLiteral(resourceName: "acido")
        cell.imagemImageView.image = produto.imagem as? UIImage
        cell.nomeProdutoLabel.text = produto.nome
        cell.obsTextView.text = produto.obs
        cell.opcionalLabel.text = produto.opcional
        
        return cell
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
