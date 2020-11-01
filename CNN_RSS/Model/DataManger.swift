//
//  DataManger.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import Foundation

/*This is a Singleton which keeps the RSS information that been received.
All the information saved in RSSDictionary property.The last item selected from list feed saved in lastFeedSelected property*/
class DataManger {
    static let shared:DataManger = DataManger()
    private init(){}

    var RSSDictionary:[RSSType:[RSSItem]] = [:]
    var lastFeedSelected:RSSItem?
}
