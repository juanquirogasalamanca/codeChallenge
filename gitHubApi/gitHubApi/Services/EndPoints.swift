//
//  EndPoints.swift
//  gitHubApi
//
//  Created by Juan Guillermo Quiroga Salamanca on 11/5/19.
//  Copyright © 2019 Juan Guillermo Quiroga Salamanca. All rights reserved.
//

import Foundation

class EndPoints {
    static let sharedInstance = EndPoints()
    
    static let urlServer = "https://api.github.com/"
    
    
    func searchUser (user : String) -> String{
        return (EndPoints.urlServer + "search/users?q=" + user )
        
    }
    
    
    
}
