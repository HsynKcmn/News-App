//
//  SourceWebView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct SourceWebView:View{
    
    let url:String
    
    var body: some View{
        VStack{
            SwiftUIWebView(urlString: url)
            Spacer()
        }
        .navigationTitle("News Source")
    }
}
