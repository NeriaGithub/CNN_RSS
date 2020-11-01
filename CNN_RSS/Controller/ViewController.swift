//
//  ViewController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 29/10/2020.
//

import UIKit

class ViewController: BaseRSSViewController {
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var feedTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeInterval = 1
        updateByTimer()
        feedTitleGestureConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLastFeedSelectedTitle()
    }
    
    func viewControllerConfig() {
       updateByTimer()
    }
    
    
    func setLastFeedSelectedTitle() {
        guard let unwrappedLastFeedSelected = DataManger.shared.lastFeedSelected else {return}
        feedTitleLabel.text = unwrappedLastFeedSelected.title
    }
    
    func feedTitleGestureConfig() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFeedLabel))
        feedTitleLabel.addGestureRecognizer(tap)
    }
    
    @objc func tapFeedLabel(gesture:UITapGestureRecognizer)  {
        guard let _ = DataManger.shared.lastFeedSelected else {return}
        performSegue(withIdentifier: "segueFromRoot", sender: self)
    }
    
    override func updateByTimer() {
        let date = Date()
        dateAndTimeLabel.text = date.getDateStringByDateFormat()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "segueFromRoot"{
            let viewController = segue.destination as! WebViewController
            viewController.rssItem = DataManger.shared.lastFeedSelected
        }
        
    }
}


