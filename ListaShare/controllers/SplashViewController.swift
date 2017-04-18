//
//  SplashViewController.swift
//  ListaShare
//
//  Created by Ettore Luglio on 18/04/17.
//  Copyright © 2017 Tamadrum. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController:UIViewController {
    
    override func viewDidLoad() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ir), userInfo: nil, repeats: false)
    }
    
    func ir() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "loginScreen")
        
        present(view, animated: false, completion: nil)
    }
    
}
