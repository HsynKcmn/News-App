//
//  TabView.swift
//  NewsAppTabView App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct NewsAppTabView : View {
    
    @ObservedObject var newsVM = NewsViewModel()
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            //Tab Views
            TabView(selection: $newsVM.selectedTab) {
                SearchTabView(newsVM: newsVM)
                    .tag("News")
                FavoritesTabView(newsVM: newsVM)
                    .tag("Favorites")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            //Tab Bar Buttons
            HStack(spacing: 0){
                TabButton(title: "News", image: "house")
                TabButton(title: "Favorites", image: "star.fill")
            }
            .padding(.horizontal,24)
            .padding(.vertical,12)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
    
    @ViewBuilder
    func TabButton(title:String, image:String) -> some View{
        
        Button(action: {
            withAnimation {
                newsVM.selectedTab = title
            }
        }) {
            VStack{
                Image(systemName: image)
                    .font(.title2)
                    .frame(height: 18)
                
                Text(title)
                    .font(.caption.bold())
            }
        }
        .foregroundColor( newsVM.selectedTab == title ? .purple : .primary.opacity(0.5))
        .frame(maxWidth: .infinity)
    }
    
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
