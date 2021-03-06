//
//  SearchScreenWorker.swift
//  gitHubApi
//
//  Created by Juan Guillermo Quiroga Salamanca on 11/5/19.
//  Copyright (c) 2019 Juan Guillermo Quiroga Salamanca. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class SearchScreenWorker
{
    func getUsersData(user: String  , completion: @escaping (SearchScreen.User.UserList?, Error?) -> ())
  {
    AlamoFireRequests.sharedInstance.requestUser(user: user, success: { (response) in
        completion(response, nil)
    }) { (error) in
        completion(nil, error)
    }
  }
}
