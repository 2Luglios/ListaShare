//
//  Dao.swift
//  ListaShare
//
//  Created by Rodrigo Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Dao<T> where T:NSManagedObject {

    var tabela: String
    var contexto: NSManagedObjectContext!
    var d = true
    
    init () {
        if type(of: T.self) == type(of: Produto.self) {
            tabela = "Produto"
        } else if type(of: T.self) == type(of: Lista.self) {
            tabela = "Lista"
        } else if type(of: T.self) == type(of: Compartilhamento.self) {
            tabela = "Compartilhamento"
        } else if type(of: T.self) == type(of: Shared.self) {
            tabela = "Shared"
        } else {
            tabela = ""
        }
        
        if let app = UIApplication.shared.delegate as? AppDelegate {
            contexto = app.persistentContainer.viewContext
        }
    }
    
    func new() -> T {
        if d {print("Instanciando \(tabela)")}
        return NSEntityDescription.insertNewObject(forEntityName: tabela, into: contexto) as! T
    }
    
    func list() -> [T] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: tabela)
        
        do {
            return try contexto.fetch(fetchRequest) as! [T]
        } catch let error as NSError {
            if d {print("Erro ao listar \(error) \(error.userInfo)")}
            return []
        }
    }
    
    func delete(t:T) {
        if d {print("Deletando objeto da tabela \(tabela)")}
        contexto.delete(t)
    }
    
    func reset() {
        if d {print("Limpando contexto")}
        contexto.reset()
    }
    
    func saveContext () {
        if contexto.hasChanges {
            do {
                if d {print("Salvando")}
                try contexto.save()
            } catch {
                let nserror = error as NSError
                if d {print("Unresolved error \(nserror), \(nserror.userInfo)")}
            }
        }
    }
}
