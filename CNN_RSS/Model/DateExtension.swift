//
//  DateExtension.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import Foundation

extension Date{
    func getDateStringByDateFormat(dateFormat:String = "dd-MMMM-yyyy HH:mm:ss")-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let timeZone = TimeZone(identifier: TimeZone.current.identifier)
        formatter.timeZone = timeZone
       return formatter.string(from: self)
        
    }
}
