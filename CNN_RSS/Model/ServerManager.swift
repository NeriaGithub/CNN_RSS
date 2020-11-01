//
//  ServerManager.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 29/10/2020.
//

import Foundation
import Alamofire

// Use this enum when server call is failed
enum ApiError:Error {
    case failure
}
// This struct contains server calls by Alamofire 
struct ServerManager {
    static func getRSSNews(stringUrl:String,CompletionHandler:@escaping(Result<Data,ApiError>)->()){
        guard let url = URL(string: stringUrl) else { return}
        AF.request(url,method: .get).responseData { (response) in
            if let dataResponse = response.data{
                CompletionHandler(.success(dataResponse))
            }else{
                CompletionHandler(.failure(.failure))
            }
        }
    }
}
