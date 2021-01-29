//
//  APIManager.swift
//  EventList
//

import Alamofire


class APIManager {
    
    static let sharedInstance = APIManager()
    
    func callSignupAPI(user: User, completionHandler: @escaping (Bool) -> ()) {
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(signup_url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers)
            .response {
                response in debugPrint(response)
                
                switch response.result {
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        if response.response?.statusCode == 200 {
                            completionHandler(true)
                        } else {
                            completionHandler(false)
                        }
                    } catch {
                        completionHandler(false)
                    }
                case .failure(let err ):
                    print(err.localizedDescription)
                }
            }
    }
    
    
    func login(user: User, completionHandler: @escaping Handler ) {
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        
        AF.request(login_url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers)
            .response {
                response in debugPrint(response)
                
                switch response.result {
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        if response.response?.statusCode == 200 {
                            completionHandler(.success(json ))
                        } else {
                            completionHandler(.failure(.custom(message: "Something went wrong!")))
                        }
                    } catch {
                        completionHandler(.failure(.custom(message: "Try again!")))
                    }
                case .failure(let err ):
                    print(err.localizedDescription)
                }
            }
    }
    
    
     
}
