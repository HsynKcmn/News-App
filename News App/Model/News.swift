//
//  Articles.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//

import Foundation

struct News:Codable, Identifiable{
    
    var id:UUID = UUID()
    
    var source:Source
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

extension News{
    static func getSample()->News{
        let source:Source = .init(id: "Source ID", name: "axios")
        return .init(id: UUID(), source: source, author: "Shawna Che", title: "Will Smith resigns from Academy over Chris Rock slap - Axios", description: "\"My actions at the 94th Academy Awards presentation were shocking, painful, and inexcusable,\" he said.", url: "https://www.axios.com/will-smiith-oscars-slap-academy-b0096ffd-2008-4e54-8ca9-ba705f01b6d8.html", urlToImage: "https://static01.nyt.com/images/2022/03/24/sports/24nba-enes-freedom1/24nba-enes-freedom1-facebookJumbo.jpg", publishedAt: "2022-04-02T11:58:04Z", content: "Will Smith said Friday that he will resign from his membership in the Academy of Motion Picture Arts and Sciences and \"fully accept any and all consequences\" for slapping Chris Rock at Sunday's Oscar… [+1317 chars]Will Smith said Friday that he will resign from his membership in the Academy of Motion Picture Arts and Sciences and \"fully accept any and all consequences\" for slapping Chris Rock at Sunday's Oscar… [+1317 chars]Will Smith said Friday that he will resign from his membership in the Academy of Motion Picture Arts and Sciences and \"fully accept any and all consequences\" for slapping Chris Rock at Sunday's Oscar… [+1317 chars]Will Smith said Friday that he will resign from his membership in the Academy of Motion Picture Arts and Sciences and \"fully accept any and all consequences\" for slapping Chris Rock at Sunday's Oscar… [+1317 chars]")
    }
}
