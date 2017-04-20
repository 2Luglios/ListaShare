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
    
    var animatedImage: UIImage!
    var launch1: UIImage! = UIImage(named: "launch-1")
    var launch2: UIImage! = UIImage(named: "launch-2")
    var launch3: UIImage! = UIImage(named: "launch-3")
    var launch4: UIImage! = UIImage(named: "launch-4")
    var launch5: UIImage! = UIImage(named: "launch-5")
    var launch6: UIImage! = UIImage(named: "launch-6")
    var launch7: UIImage! = UIImage(named: "launch-7")
    var images: [UIImage] = []
    
    @IBOutlet weak var launchImage: UIImageView!
    
    override func viewDidLoad() {
        
        images = [launch1, launch2, launch3, launch4, launch5, launch6, launch7]
        animatedImage = UIImage.animatedImage(with: images, duration: 2.0)
        launchImage.image = animatedImage
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ir), userInfo: nil, repeats: false)
    }
    
    func ir() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "loginScreen")
        
        present(view, animated: true, completion: nil)
    }
    
}
