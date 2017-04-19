//
//  Usuario.swift
//  ListaShare
//
//  Created by Ettore Luglio on 19/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class Usuario: NSObject, NSCoding {
    
    var nome: String!
    var email:String!
    var senha:String!
    
    override init() {
        super.init()
        
        nome = ""
        email = ""
        senha = ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey:"nome")
        aCoder.encode(email, forKey:"email")
        aCoder.encode(senha, forKey:"senha")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey:"nome") as! String
        email = aDecoder.decodeObject(forKey:"email") as! String
//        senha = aDecoder.decodeObject(forKey:"senha") as! String
    }
    
    func save () {
        NSKeyedArchiver.archiveRootObject(self, toFile: getArchive(for:"usuario"))
    }
    
    func load() {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getArchive(for:"usuario")) {
            let usuario = loaded as! Usuario
            
            self.nome = usuario.nome
            self.email = usuario.email
            self.senha = usuario.senha
        }
    }
    
    func getArchive(for resource: String) -> String {
        let usersDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = usersDirs[0]
        
        let archive = "\(dir)/listashare-\(resource).dados"
        return archive
    }
    
}
