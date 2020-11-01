//
//  WebViewController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 31/10/2020.
//

import UIKit
import WebKit



class WebViewController: UIViewController {
    var rssItem:RSSItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewConfig()
    }
    
    func webViewConfig() {
        let webView: WKWebView = WKWebView()
        self.view.addSubview(webView)
        buildWebViewConstraints(webView: webView)
        loadFeed(webView: webView)
    }
    
    func buildWebViewConstraints(webView:WKWebView) {
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        webView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func loadFeed(webView:WKWebView)  {
        guard let urlString = rssItem?.link, let linkUrl = URL(string: urlString) else { return }
        webView.load(URLRequest(url: linkUrl))
    }
    
    
    
    
    
    
}
