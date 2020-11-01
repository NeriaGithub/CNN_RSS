//
//  TableController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 31/10/2020.
//

import UIKit
 // Delegate for selected feed
protocol TableControllerDelegate:class {
    func selectedFeedItem(rssItem:RSSItem)
}
// This class responsible for Table View configuration  and the delegates methods
class TableController:NSObject{
    var tableView:UITableView
    weak var delegate:TableControllerDelegate?
    init(tableView:UITableView) {
        self.tableView = tableView
        super.init()
        tableViewConfig()
    }
    
    func tableViewConfig()  {
        let rssNib = UINib(nibName: "SportAndEntertainmentRSSCell", bundle: nil)
        tableView.register(rssNib, forCellReuseIdentifier: "sportAndEntertainmentRSSCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - TableView delegates
extension TableController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return DataManger.shared.RSSDictionary[.entertainment]?.count ?? 0
        } else {
            return DataManger.shared.RSSDictionary[.worldSport]?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Entertainment"
        } else {
            return "World Sport"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportAndEntertainmentRSSCell", for: indexPath) as! SportAndEntertainmentRSSCell
        
        if indexPath.section == 1 {
            cell.cellConfig(rssItem: DataManger.shared.RSSDictionary[.entertainment]?[indexPath.row] ?? nil)
        } else {
            cell.cellConfig(rssItem: DataManger.shared.RSSDictionary[.worldSport]?[indexPath.row] ?? nil)
        }
        return cell
    }
}

extension TableController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rssItem:RSSItem?
        if indexPath.section == 1 {
          rssItem = DataManger.shared.RSSDictionary[.entertainment]?[indexPath.row]
        } else{
            rssItem = DataManger.shared.RSSDictionary[.worldSport]?[indexPath.row]
        }
        guard let unwrappedRSSItem = rssItem else { return  }
        DataManger.shared.lastFeedSelected = unwrappedRSSItem
        delegate?.selectedFeedItem(rssItem: unwrappedRSSItem)
    }
}
