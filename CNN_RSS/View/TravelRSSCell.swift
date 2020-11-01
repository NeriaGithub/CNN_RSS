//
//  TravelRSSCell.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import UIKit

class TravelRSSCell: UICollectionViewCell {
    @IBOutlet weak var RSSTitleLabel: UILabel!
    @IBOutlet weak var RSSDescriptionLabel: UILabel!
    @IBOutlet weak var RSSLinkLabel: UILabel!
    @IBOutlet weak var RSSPubDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cellConfig(rssItem:RSSItem) {
        RSSTitleLabel.text = rssItem.title
        RSSDescriptionLabel.text = rssItem.desc
        RSSLinkLabel.text = rssItem.link
        RSSPubDateLabel.text = rssItem.pubDate
    }
    
    
    //  creates dynamic height for the collection view cell 
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           setNeedsLayout()
           layoutIfNeeded()
           let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
           var frame = layoutAttributes.frame
           frame.size.height = ceil(size.height)
           layoutAttributes.frame = frame
           return layoutAttributes
       }

}
