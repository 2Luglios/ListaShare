//
//  GruposViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class GruposViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GravaNaListaDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var compartilhamentos:[Compartilhamento] = []
    var indiceCompartilhamentoSelecionado:Int!
    
    override func viewDidLoad() {
        compartilhamentos = Dao<Compartilhamento>().list()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return compartilhamentos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customcell", for: indexPath) as! CustomCollectionViewCell
        
        if compartilhamentos[indexPath.row].imagem == nil {
            cell.imagem.image = #imageLiteral(resourceName: "calendario")
        } else {
            cell.imagem.image = compartilhamentos[indexPath.row].imagem as? UIImage
        }
        
        cell.nome.text = compartilhamentos[indexPath.row].nome
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCompartilhado" {
            let listaProdutos = segue.destination as! ListaProdutoTableViewController
            
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let listaSelecionada = compartilhamentos[indexPath.row]
            
            indiceCompartilhamentoSelecionado = indexPath.row
            listaProdutos.delegate = self
            listaProdutos.produtos = listaSelecionada.produtos?.allObjects as! [Produto]
        }
    }
    
    func gravarProdutoNaLista(_ produto: Produto) {
        compartilhamentos[indiceCompartilhamentoSelecionado].addToProdutos(produto)
    }
    
}
