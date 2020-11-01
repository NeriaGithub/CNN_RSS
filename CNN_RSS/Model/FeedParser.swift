//
//  FeedParser.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 29/10/2020.
//

import Foundation


// This enum is used for feed element from xml
enum RssElements:String{
    case item = "item"
    case title = "title"
    case description = "description"
    case  link = "link"
    case pubDate = "pubDate"
}

// Use this delegate when parser finish to parse xml data
protocol FeedParserDelegate:class {
    func paserFinish(rssItems:[RSSItem],rssType:RSSType)
}


// Responsible for parse xml data
class FeedParser: NSObject {
    
    var parser:XMLParser
    var rssType:RSSType
    weak var delegate: FeedParserDelegate?
    init(parser:XMLParser, rssType:RSSType) {
        self.parser = parser
        self.rssType = rssType
        super.init()
        parser.delegate = self
        
    }
    var rssItems:[RSSItem] = []
    var currentElement = ""
    var currentTitle = ""
    var currentDescription = ""
    var currentLink = ""
    var currentPubDate = ""
}

 // MARK: - XMLParserDelegate
extension FeedParser:XMLParserDelegate{
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == RssElements.item.rawValue {
            currentTitle = ""
            currentDescription = ""
            currentLink = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch currentElement {
        case RssElements.title.rawValue:
            currentTitle = string
        case RssElements.description.rawValue:
            if currentDescription.isEmpty {
                currentDescription = string
            }
        case RssElements.link.rawValue:
            currentLink = string
        case RssElements.pubDate.rawValue:
            currentPubDate = string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            /* This condition checks the information inside the title and description properties is "valid"*/
            if currentTitle.count > 5 && currentDescription.count > 5{
                let rssItem = RSSItem(title: currentTitle, desc: currentDescription, link: currentLink, pubDate: currentPubDate)
                rssItems.append(rssItem)
            }
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        delegate?.paserFinish(rssItems: rssItems, rssType: rssType)
    }
    
}

