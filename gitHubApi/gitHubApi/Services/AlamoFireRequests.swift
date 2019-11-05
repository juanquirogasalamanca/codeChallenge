//
//  Services.swift
//  gitHubApi
//
//  Created by Juan Guillermo Quiroga Salamanca on 11/5/19.
//  Copyright © 2019 Juan Guillermo Quiroga Salamanca. All rights reserved.
//

import Foundation
import Alamofire

class AlamoFireRequests: NSObject {
    static let sharedInstance = AlamoFireRequests()
    
    
    func requestUser(user : String, success:@escaping (SearchScreen.User.UserList) -> Void, failure:@escaping (Error) -> Void)
    {
        let strURL = EndPoints.sharedInstance.searchUser(user: user)
        //print(strURL)
        Alamofire.request(strURL).responseData { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                guard let user = try? JSONDecoder().decode(SearchScreen.User.UserList.self, from: responseObject.data!)else{return}
                
                success(user)
            }

            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                print(error)
                failure(error)
            }
        }
    }

//    func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
//            //print(responseObject)
//            if responseObject.result.isSuccess {
//                let resJson = JSON(responseObject.result.value!)
//                success(resJson)
//            }
//            if responseObject.result.isFailure {
//                let error : Error = responseObject.result.error!
//                failure(error)
//            }
//        }
//    }
    
}
