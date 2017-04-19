//
//  DadosSync.swift
//  ListaShare
//
//  Created by Ettore Luglio on 19/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import Alamofire

class DadosSync {
    
    let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?APPID=5bcaf752f78fcba6b4dc5f9d36e9df2e&units=metric"
    let URL_BASE_IMAGE = "http://openweathermap.org/img/w/"
    
    
    func getMinhasListas() {
//        let param = ["lon" : 0, "lat" : 0]
//        Alamofire.request(URL_BASE, parameters: param).responseObject {
//            (response:DataResponse<Lista>) in
//            if let temp = response.result.value {
//                // Faz alguma coisa com os labels
//                let url = "\(self.URL_BASE_IMAGE)\((temp.icon)!).png"
//                print(url)
//                self.imagem.af_setImage(withURL: URL(string: url)!)
//            }
//            
//        }
    }
    
    func sendMinhasListas() {
        
    }
    
    func getListasCompartilhadasComigo () {
        
    }
    
    func sendListasCompartilhadas() {
        
    }
    
}
