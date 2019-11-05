//
//  ResultScreenInteractor.swift
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

protocol ResultScreenBusinessLogic
{
  func doSomething(request: ResultScreen.Something.Request)
}

protocol ResultScreenDataStore
{
  //var name: String { get set }
}

class ResultScreenInteractor: ResultScreenBusinessLogic, ResultScreenDataStore
{
  var presenter: ResultScreenPresentationLogic?
  var worker: ResultScreenWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ResultScreen.Something.Request)
  {
    worker = ResultScreenWorker()
    worker?.doSomeWork()
    
    let response = ResultScreen.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
