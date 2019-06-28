//
//  Error.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/26/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class Error {
    
    enum ErrorMessage {
        case arNotSupported
        case generic
        case character
        case characterSearch
        
        var details: (title: String, body: String) {
            switch self {
            case .arNotSupported:
                return (title: "ARKit not supported.", body: "Your device does not support ARKit.")
            case .generic:
                return (title: "An error has occured.", body: "That action could not be completed, please try again later..")
            case .character:
                return (title: "Error Retrieving Character Data", body: "We were unable to retrieve your character data, please try again later or file a bug report.")
            case .characterSearch:
                return (title: "Search Failed", body: "There was an error retrieving search data, please try again later.")
            }
        }
    }
    
    class func presentError(error: ErrorMessage, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: error.details.title, message: error.details.body, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(okAction)
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    
    
}
