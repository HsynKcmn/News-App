//
//  SearchTabView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct SearchTabView : View {
    
    @ObservedObject var newsVM:NewsViewModel
    
    var body: some View{
        
        VStack(spacing:0){
            VStack{
                topView()
                scrollView()
                    .padding()
                    .offset(y:-20)
            }
        }
        .navigationTitle("News")
    }
    
    @ViewBuilder
    func topView() -> some View{
        HStack{
            Text("Appcent ")
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .font(.title3)
            Text("News App")
                .foregroundColor(.gray)
                .font(.title3)
        }
        .padding(12)
        
        VStack(spacing:0){
            HStack(spacing: 15){
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search News", text: $newsVM.searchTerm)
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            
            // Divider Line...
            HStack{
                Text(newsVM.searchTerm == "" ? "Recent News" : "News Result")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.6))
                    .frame(height: 0.5)
            }
            .padding()
        }
    }
    
    func scrollView() -> some View{
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 16){
                
                ForEach(newsVM.lastest){news in
                    NavigationLink {
                        DetailView(news: news, newsVM: newsVM, isFavorited: newsVM.isFavorited(news: news))
                    } label: {
                        RowView(news: news)
                    }.buttonStyle(.plain)
                }
            }
            .padding(.top)
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
