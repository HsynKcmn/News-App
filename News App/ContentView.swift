//
//  ContentView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NewsAppTabView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
