//
//  TravelRSSViewController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import UIKit

class TravelRSSViewController: BaseRSSViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionController:CollectionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionController = CollectionController(collectionView: collectionView)
        timeInterval = 5
        travelRSSRequest()
    }
    
    override func updateByTimer() {
        travelRSSRequest()
    }
    
    
//Get the Travel request RSS
     func travelRSSRequest() {
        ServerManager.getRSSNews(stringUrl: RSSType.getUrlString(rssType: .travel)) { (result) in
            switch result {
            case .success(let RSSData):
                // Create instance for FeedParser to parse XML
                let parser = XMLParser(data: RSSData)
                let feedParser = FeedParser(parser: parser, rssType: .travel)
                feedParser.delegate = self
                parser.parse()
            
            case .failure(_):
                print("error")
            }
        }
    }

}

// MARK: - FeedParserDelegate
extension TravelRSSViewController:FeedParserDelegate{
    func paserFinish(rssItems: [RSSItem], rssType: RSSType) {
        print("reload")
        DataManger.shared.RSSDictionary[rssType] = rssItems
        collectionController?.reloadCollectionData()
    }
 
}
