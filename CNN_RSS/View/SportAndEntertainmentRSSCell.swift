//
//  SportAndEntertainmentRSSCell.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 31/10/2020.
//

import UIKit

class SportAndEntertainmentRSSCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var RSSTitleLabel: UILabel!
    @IBOutlet weak var RSSDescriptionLabel: UILabel!
    @IBOutlet weak var RSSLinkLabel: UILabel!
    @IBOutlet weak var RSSPubDateLabel: UILabel!
    
    func cellConfig(rssItem:RSSItem?) {
        guard let unwrappedRSSItem = rssItem else { return}
        let bgColor = UIColor.random()
            containerView.backgroundColor = bgColor
        RSSTitleLabel.text = unwrappedRSSItem.title
        RSSTitleLabel.textColor = UIColor.textColor(bgColor: bgColor)
        RSSDescriptionLabel.text = unwrappedRSSItem.desc
        RSSDescriptionLabel.textColor = UIColor.textColor(bgColor: bgColor)
        RSSLinkLabel.text = unwrappedRSSItem.link
        RSSLinkLabel.textColor = UIColor.textColor(bgColor: bgColor)
        RSSPubDateLabel.text = unwrappedRSSItem.pubDate
        RSSPubDateLabel.textColor = UIColor.textColor(bgColor: bgColor)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
