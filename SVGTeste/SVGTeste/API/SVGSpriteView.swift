//
//  SVGSpriteView.swift
//  
//
//  Created by Rondinelli Morais on 28/09/15.
//  Copyright (c) 2015 Rondinelli Morais. All rights reserved.
//

import UIKit

class SVGSpriteView: UIView, UIWebViewDelegate {
    
    // MARK: Propertie
    private var webView:UIWebView? = nil
    private var activityIndicatorView:UIActivityIndicatorView? = nil
    
    var imageID:String? = nil {
        didSet {
            self.loadHTML()
        }
    }
    
    var spriteFile:String? = nil {
        didSet {
            if self.imageID != nil {
                self.loadHTML()
            }
        }
    }
    
    override var frame:CGRect {
        didSet {
            if self.webView != nil {
                self.webView!.frame = self.bounds
            }
        }
    }
    
    // MARK: Override
    convenience init(imageID:String, spriteFile:String){
        self.init()
        self.initialize()
        self.imageID = imageID
        self.spriteFile = spriteFile
        self.loadHTML()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    // MARK: Private methods
    private func initialize() {

        webView = UIWebView(frame: self.bounds)
        webView!.opaque = false
        webView!.backgroundColor = UIColor.clearColor()
        webView!.scrollView.showsHorizontalScrollIndicator = false
        webView!.scrollView.showsVerticalScrollIndicator = false
        webView!.scrollView.bounces = false
        webView!.delegate = self
        self.addSubview(webView!)
    }
    
    private func loadHTML(){
        
        var path = NSBundle.mainBundle().pathForResource("renderer", ofType: "html")
        
        if path != nil
        {
            var URL = NSURL(fileURLWithPath: path!)
            var request = NSURLRequest(URL: URL!)
            
            if self.imageID != nil {
                var URLString = URL!.absoluteString
                var queryString = "?imageID=\(self.imageID!)&spriteFile=\(self.spriteFile!)"
                var URLwithQueryString = URLString!.stringByAppendingString(queryString)
                var finalURL = NSURL(string: URLwithQueryString)
                request = NSURLRequest(URL: finalURL!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            }
            
            if webView != nil {
                webView!.loadRequest(request)
            }
        }
    }
    
    // MARK: UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activityIndicatorView!.center = webView.center
        activityIndicatorView!.hidesWhenStopped = true
        activityIndicatorView!.startAnimating()
        webView.addSubview(activityIndicatorView!)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicatorView!.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        activityIndicatorView!.stopAnimating()
    }
}
