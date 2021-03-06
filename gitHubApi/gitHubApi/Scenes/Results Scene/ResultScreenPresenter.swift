//
//  ResultScreenPresenter.swift
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

protocol ResultScreenPresentationLogic
{
  func presentSomething(response: ResultScreen.UserList.Response)
}

class ResultScreenPresenter: ResultScreenPresentationLogic
{
  weak var viewController: ResultScreenDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: ResultScreen.UserList.Response)
  {
   // let viewModel = ResultScreen.UserList.ViewModel(login: <#String#>)
    
//    viewController?.displaySomething()
  }
}
