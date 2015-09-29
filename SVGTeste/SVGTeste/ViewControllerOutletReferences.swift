//
//  ViewController.swift
//  SVGTeste
//
//  Created by Rondinelli Morais on 28/09/15.
//  Copyright (c) 2015 Rondinelli Morais. All rights reserved.
//

import UIKit

class ViewControllerOutletReferences: UIViewController {
    
    @IBOutlet weak var imageView: SVGSpriteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var imagesID:[String] = ["icon-seta-direita", "icon-localizar", "icon-loja", "icon-calendario", "icon-favoritos", "icon-conteudos"]
                
        // add image ID using object reference storyboard
        self.imageView.spriteFile = "bunny-sprite-sheet.svg"
        self.imageView.imageID = "icon-cloud"
    }
}

