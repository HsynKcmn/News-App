//
//  FavoritesTabView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct FavoritesTabView : View {
    
    @ObservedObject var newsVM:NewsViewModel
    
    var body: some View{
        VStack(spacing:24){
            HStack{
                Text("Favorite ")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .font(.title3)
                Text("News")
                    .foregroundColor(.gray)
                    .font(.title3)
            }
            .padding(16)
            if newsVM.favorites.isEmpty{
                Text("There is no favorite news.")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular, design: .serif))
            }else{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 16){
                        ForEach(newsVM.favorites){news in
                            NavigationLink {
                                DetailView(news: news, newsVM: newsVM, isFavorited: newsVM.isFavorited(news: news))
                            } label: {
                                RowView(news: news)
                            }.buttonStyle(.plain)
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Favorites")
    }
    
}
