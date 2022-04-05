//
//  SwitUIWebView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: urlString) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
