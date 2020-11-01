//
//  RSSType.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import Foundation


// This enum responsible for RSSDictionary keys and  creating urlString
enum RSSType{
    case travel
    case worldSport
    case entertainment
    
    static func getUrlString(rssType:Self)->String{
        let text:String
        switch rssType {
        case .travel:
         text = "travel"
        case.worldSport:
           text = "sport"
        case .entertainment:
            text = "entertainment"
        }
        return "http://rss.cnn.com/rss/edition_\(text).rss"
    }
}


