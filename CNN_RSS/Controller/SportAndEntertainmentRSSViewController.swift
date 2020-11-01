//
//  SportAndEntertainmentRSSViewController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 31/10/2020.
//

import UIKit



class SportAndEntertainmentRSSViewController: BaseRSSViewController {

    @IBOutlet weak var sportAndEntertainmentTableView: UITableView!
    var tableController:TableController?
    var lastSelectedRSSItem:RSSItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableController = TableController(tableView: sportAndEntertainmentTableView)
        timeInterval = 5
        tableController?.delegate = self
        worldSportRSSRequest()
        entertainmentRSSRequest()
    }
    //Get World Sport request RSS
    func worldSportRSSRequest() {
        ServerManager.getRSSNews(stringUrl: RSSType.getUrlString(rssType: .worldSport)) { (result) in
            switch result {
            case .success(let RSSData):
                // Create instance for FeedParser to parse XML
                let parser = XMLParser(data: RSSData)
                let feedParser = FeedParser(parser: parser, rssType: .worldSport)
                feedParser.delegate = self
                parser.parse()
            
            case .failure(_):
                break
            }
        }
    }
    //Get Entertainment request RSS
    func entertainmentRSSRequest() {
        ServerManager.getRSSNews(stringUrl: RSSType.getUrlString(rssType: .entertainment)) { (result) in
            switch result {
            case .success(let RSSData):
                // Create instance for FeedParser to parse XML
                let parser = XMLParser(data: RSSData)
                let feedParser = FeedParser(parser: parser, rssType: .entertainment)
                feedParser.delegate = self
                parser.parse()
            
            case .failure(_):
                break
            }
        }
    }
    
    override func updateByTimer() {
        worldSportRSSRequest()
        entertainmentRSSRequest()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromTableFeeds"{
            let viewController = segue.destination as! WebViewController
            viewController.rssItem = lastSelectedRSSItem
        }
    }
}

extension SportAndEntertainmentRSSViewController:TableControllerDelegate{
    func selectedFeedItem(rssItem: RSSItem) {
        lastSelectedRSSItem = rssItem
        performSegue(withIdentifier: "segueFromTableFeeds", sender: self)
    }
}


extension SportAndEntertainmentRSSViewController:FeedParserDelegate{
    func paserFinish(rssItems: [RSSItem], rssType: RSSType) {
        if rssType == .worldSport {
            DataManger.shared.RSSDictionary[rssType] = rssItems
        }
        else{
            DataManger.shared.RSSDictionary[rssType] = rssItems
        }
        sportAndEntertainmentTableView.reloadData()
    }
}
