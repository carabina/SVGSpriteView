//
//  ViewControllerURLSpriteFile.swift
//  SVGTeste
//
//  Created by Rondinelli Morais on 28/09/15.
//  Copyright (c) 2015 Rondinelli Morais. All rights reserved.
//

import UIKit

class ViewControllerURLSpriteFile: UIViewController {

    @IBOutlet weak var imageView: SVGSpriteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.spriteFile = "http://dbushell.com/demos/svg/2015-01-29/sprite.svg"
        
        var ids = ["smile-face"]
        self.imageView.imageID = ids[Int(arc4random_uniform(UInt32(ids.count)))]
    }
}
