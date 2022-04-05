//
//  RowView.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import SwiftUI

struct RowView : View {
    
    var news : News
    
    var body: some View{
        
        HStack{
            VStack(alignment: .leading, spacing:4){
                Text(news.title ?? "News")
                    .font(.system(size: 14, weight: .heavy, design: .serif))
                Text(news.description ?? "")
                    .font(.system(size: 12, weight: .regular, design: .serif))
                    .lineLimit(3)
            }
            Spacer()
            AsyncImage(url: URL(string: news.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        .padding([.leading,.trailing])
    }
}

