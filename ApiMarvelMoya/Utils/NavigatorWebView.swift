//
//  NavigatorWebView.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 24/2/21.
//

import SwiftUI
import WebKit

struct NavigatorWebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct NavigatorWebView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorWebView(request: URLRequest(url: URL(string: "https://www.google.es")!))
    }
}
