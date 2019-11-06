//
//  SearchScreenViewController.swift
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
import AlamofireNetworkActivityIndicator


protocol SearchScreenDisplayLogic: class
{
  func displayResponse(viewModel: [SearchScreen.User.ViewModel])
  func displayError(error : String)
}

class SearchScreenViewController: UIViewController, SearchScreenDisplayLogic
{
    
 
  var interactor: SearchScreenBusinessLogic?
  var router: (NSObjectProtocol & SearchScreenRoutingLogic & SearchScreenDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = SearchScreenInteractor()
    let presenter = SearchScreenPresenter()
    let router = SearchScreenRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var searchTextField: UITextField!
   
    @IBAction func searchButtonAction(_ sender: Any) {
        
        guard let user = searchTextField.text, !searchTextField.text!.isEmpty else
        {
            displayError(error: "Write Something!")
            return
        }
        
        getResutls(searchStr: user)
        NetworkActivityIndicatorManager.shared.isEnabled = true
    }

    
  func getResutls(searchStr : String)
  {
    let request = SearchScreen.User.Request(userName: searchStr)
    interactor?.getSearchResult(request: request)
  }
    
  func displayResponse(viewModel: [SearchScreen.User.ViewModel])
  {
    //nameTextField.text = viewModel.name
    print("Result")
    NetworkActivityIndicatorManager.shared.isEnabled = false
    print(viewModel.count)
    //performSegue(withIdentifier: "result", sender: viewModel)
    // router?.perform(UIStoryboardSegue()
    router?.routeToResults(segue: nil)
  }
    
    
  func displayError(error: String) {
//       loginUserText.text = "Error " + error
    let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    

    self.present(alert, animated: true)
    print(error)
  }
}
