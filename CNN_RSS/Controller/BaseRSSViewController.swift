//
//  BaseRSSViewController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import UIKit


/* All classes without WebViewController class inherits from this class.
 This class responsible to start and stop the timer.
 It's subclasses override the updateByTimer function*/
class BaseRSSViewController: UIViewController {
    var timer:Timer?
    var timeInterval:TimeInterval = 0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timerConfig()
    }
    
    func timerConfig()   {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateByTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateByTimer() {}

    func stopTimer() {
      timer?.invalidate()
        timer = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }

}
