//
//  CadastroProdutoViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class CadastroProdutoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var lista: Lista!
    
    var delegate: CadastraProdutoDelegate!
    
    @IBOutlet weak var imagemImageView: UIImageView!
    @IBOutlet weak var nomeProdutoTextField: UITextField!
    @IBOutlet weak var quantidadeLabel: UILabel!
    @IBOutlet weak var marcaTextField: UITextField!
    @IBOutlet weak var marcaOpcionalTextField: UITextField!
    @IBOutlet weak var obsTextView: UITextView!
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tiraFoto))
        imagemImageView.addGestureRecognizer(tap)
        imagemImageView.isUserInteractionEnabled = true
    }
    
    func tiraFoto() {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = self
        
        let alerta = UIAlertController(title: "Selecione...", message: "Origem da Foto", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let actionCamera = UIAlertAction(title: "Camera", style: .default, handler: {
                (UIAlertAction) in
                pickerController.sourceType = .camera
                
                if let nav = self.navigationController {
                    nav.present(pickerController, animated: true, completion: nil)
                }
            })
            alerta.addAction(actionCamera)
        }
        
        let actionBiblioteca = UIAlertAction(title: "Biblioteca", style: .default, handler: {
            (UIAlertAction) in
            pickerController.sourceType = .photoLibrary
            
            if let nav = self.navigationController {
                nav.present(pickerController, animated: true, completion: nil)
            }
        })
        alerta.addAction(actionBiblioteca)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (UIAlertAction) in
            alerta.dismiss(animated: true, completion: nil)
        })
        alerta.addAction(actionCancel)
        
        if let nav = navigationController {
            nav.present(alerta, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imagemImageView?.image = image
            picker.dismiss(animated: true, completion: nil)
        }

    }
    
    @IBAction func quantidadeModificada(_ sender: UIStepper) {
        quantidadeLabel.text = "\(Int(sender.stepValue))"
    }

    @IBAction func salvar(_ sender: UIBarButtonItem) {
        let dao = Dao<Produto>()
        let produto = dao.new()
        produto.checado = false
        produto.marca = marcaTextField.text
        produto.nome = nomeProdutoTextField.text
        produto.obs = obsTextView.text
        produto.opcional = marcaOpcionalTextField.text
        produto.quantidade = Int32(quantidadeLabel.text!)!
        produto.imagem = imagemImageView.image
        
        delegate.adicionaProduto(produto)
        
        dao.saveContext()
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }
    }
    
}
