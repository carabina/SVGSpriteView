//
//  ViewController2.swift
//  SVGTeste
//
//  Created by Rondinelli Morais on 28/09/15.
//  Copyright (c) 2015 Rondinelli Morais. All rights reserved.
//

import UIKit

class ViewControllerRuntimeAddSubView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add View runtime
        var imageView2 = SVGSpriteView(imageID: "icon-localizar", spriteFile:"icons.svg")
        imageView2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView2.center = self.view.center
        self.view.addSubview(imageView2)
    }
}
