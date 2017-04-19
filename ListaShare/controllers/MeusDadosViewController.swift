//
//  MeusDadosViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class MeusDadosViewController : UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var repitaTextField: UITextField!
    
    var usuario = Usuario()
    
    override func viewDidLoad() {
        usuario.load()
        loginTextField.text = usuario.nome
        emailTextField.text = usuario.email
    }
    
    @IBAction func salvar(_ sender: UIBarButtonItem) {
        usuario.nome = loginTextField.text
        usuario.email = emailTextField.text
        
        usuario.save()
        
        navigationController?.popViewController(animated: true)
    }
    
}
