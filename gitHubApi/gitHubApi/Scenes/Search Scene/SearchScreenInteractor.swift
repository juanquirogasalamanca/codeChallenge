//
//  SearchScreenInteractor.swift
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

protocol SearchScreenBusinessLogic
{
  func getSearchResult(request: SearchScreen.User.Request)
}

protocol SearchScreenDataStore
{
  //var name: String { get set }
    var results : [SearchScreen.User.ViewModel]{get set}
}

class SearchScreenInteractor: SearchScreenBusinessLogic, SearchScreenDataStore
{
  var presenter: SearchScreenPresentationLogic?
  var worker: SearchScreenWorker?
  //var name: String = ""
    var results : [SearchScreen.User.ViewModel] = []
  // MARK: Do something
  
  func getSearchResult(request: SearchScreen.User.Request)
  {
    worker = SearchScreenWorker()
    worker?.getUsersData(user: request.userName, completion: {(response, error) in
        //response = SearchScreen.User.Response()
        if let error = error , !error.localizedDescription.isEmpty {
            self.presenter?.presentError(error: error.localizedDescription)
        }
        guard let response = response?.resultList else {return}
        self.results = response
        self.presenter?.presentResponse(response: self.results)
    })
    
    
  }
}
