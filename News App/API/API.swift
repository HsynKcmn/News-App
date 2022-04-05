//
//  API.swift
//  News App
//
//  Created by MyMac on 4.04.2022.
//


struct API{
    static var key = "16840f1e35cf4108ab49f0c8447115ef"
    
    static func getURL_Search(for search:String)->String{
        return  "https://newsapi.org/v2/everything?q=\(search)&apiKey=\(key)"
    }
    
    static func getURL_Tr()->String{
        return  "https://newsapi.org/v2/top-headlines?country=tr&apiKey=\(key)"
    }
}
