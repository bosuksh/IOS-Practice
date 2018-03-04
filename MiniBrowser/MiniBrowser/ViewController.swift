//
//  ViewController.swift
//  MiniBrowser
//
//  Created by 이상협 on 2018. 3. 4..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate,WKNavigationDelegate{
    @IBOutlet weak var BookMarkSegmentControl: UISegmentedControl!
    @IBOutlet weak var UrlView: UITextField!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var SpinningActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialURL = "https://www.facebook.com"
        let myURL = URL(string: initialURL)
        let myRequest = URLRequest(url: myURL!)
        mainWebView.load(myRequest)
        
        UrlView.text = initialURL
        mainWebView.navigationDelegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SpinningActivityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SpinningActivityIndicator.stopAnimating()
    }


    @IBAction func BookMarkAction(_ sender: Any) {
        let bookMarkURL = BookMarkSegmentControl.titleForSegment(at: BookMarkSegmentControl.selectedSegmentIndex)
        
        let urlString = "https://www.\(bookMarkURL!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        UrlView.text = urlString
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = UrlView.text!
        
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlString)"
        }
        
        UrlView.text = urlString
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        textField.resignFirstResponder()
        return true;
    }
    @IBAction func gobackAction(_ sender: Any) {
        mainWebView.goBack()
    }
    @IBAction func goforwardAction(_ sender: Any) {
        mainWebView.goForward()
    }
    @IBAction func StopAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    @IBAction func RefreshAction(_ sender: Any) {
        mainWebView.reload()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

