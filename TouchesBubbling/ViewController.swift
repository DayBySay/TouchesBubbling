//
//  ViewController.swift
//  TouchesBubbling
//
//  Created by Takayuki Sei on 2020/11/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "http://localhost:8080")!))
    }
}

