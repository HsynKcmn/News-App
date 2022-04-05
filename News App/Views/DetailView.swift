//
//  DetailView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct DetailView : View {
    
    var news:News
    
    @ObservedObject var newsVM:NewsViewModel
    
    @State var isFavorited:Bool{
        didSet{
            if isFavorited{
                newsVM.favorites.append(news)
            }else{
                newsVM.favorites = newsVM.favorites.filter({$0.id != news.id})
            }
        }
    }
    
    var body: some View{
        
        VStack(spacing:8){
            //Top Image
            AsyncImage(url: URL(string: news.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
            
            Text(news.title ?? "")
                .font(.system(size: 14, weight: .bold, design: .serif))
            HStack(){
                Label(news.author ?? "Author", systemImage: "square.and.pencil")
                Spacer()
                Label(formattedDate(string: news.publishedAt ?? ""), systemImage: "calendar")
            }
            .font(.system(size: 10, weight: .bold, design: .serif))
            .padding(24)
            ScrollView(showsIndicators: false){
                Text(news.content ?? "" )
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            NavigationLink {
                SourceWebView(url: news.url ?? "")
            } label: {
                Text("News Source")
                    .padding()
                    .border(.black, width: 1)
            }
            .buttonStyle(.plain)
            
            
        }
        .padding(24)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            isFavorited.toggle()
        }, label: {
            Image(systemName: isFavorited ? "heart.fill" : "heart")
        }))
        .navigationBarItems(trailing: Button(action: {
            if let str = news.url{
                shareSheet(url: str)
            }
        }, label: {
            Image(systemName: "square.and.arrow.up")
        }))
        .tint(.black)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
    
    func formattedDate(string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "MM dd yyyy"
        return dateFormatter.string(from: date)
    }
    
    func shareSheet(url: String) {
        let url = URL(string: url)
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }
        
        if let windowScene = scene as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
        }
    }
}
