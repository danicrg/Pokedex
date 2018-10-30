//
//  WebViewController.swift
//  Pokedex
//
//  Created by Daniel Carlander on 30/10/2018.
//  Copyright © 2018 Daniel Carlander. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var raceName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = raceName
        
        let myURL = URL(string:"http://es.pokemon.wikia.com/wiki/\(raceName ?? "Armaldo")")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
