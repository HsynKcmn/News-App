//
//  NewsViewModel.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

final class NewsViewModel: ObservableObject {
    
    @Published var selectedTab = "News"
    
    @Published var lastest:[News] = []
    
    @Published var favorites:[News] = []
    
    @Published var searchTerm: String = "" {
        didSet {
            fetchNews()
        }
    }
    
    init(){
        fetchNews()
    }
    
    private func fetchNews(){
        let urlStr = searchTerm == "" ? API.getURL_Tr() : API.getURL_Search(for: searchTerm)
        
        if let url = URL(string: urlStr) {
            NetworkManager<Articles>.fetch(for: url) { (result) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.lastest = response.articles
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }
    }
    
    func isFavorited(news:News)->Bool{
        return favorites.contains { item in
            item.id == news.id
        }
    }
    
}
