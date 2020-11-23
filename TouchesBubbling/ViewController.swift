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
        
        if let view = view as? PrintHitTestView {
            view.touchEventHandler = { hit in
                print("hit?: \(hit)")
            }
        }
    }
}

class PrintHitTestView: UIView {
    @IBInspectable var name: String = ""
    var touchEventHandler: ((_ hit: Bool) -> Void)?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hit test!: \(point), view name: \(name)")
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let result = super.point(inside: point, with: event)
        print("point!: \(point), boolean: \(result) view name: \(name)")
        touchEventHandler?(result)
        return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched began!: \(touches),\n vew name: \(name)")
        super.touchesBegan(touches, with: event)
    }
}

class CustomWKWebView: WKWebView {
    @IBInspectable var name: String = ""
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hit test!: \(point), view name: \(name)")
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let result = super.point(inside: point, with: event)
        print("point!: \(point), boolean: \(result) view name: \(name)")
        return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched began!: \(touches),\n vew name: \(name)")
        super.touchesBegan(touches, with: event)
    }
}
