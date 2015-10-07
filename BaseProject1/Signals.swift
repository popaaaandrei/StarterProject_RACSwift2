
//
//  Signals.swift
//  BaseProject1
//
//  Created by Andrei on 07/10/15.
//  Copyright © 2015 ALT TAB Mobile. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire


// MyNetworkError adopts the ErrorType protocol
enum MyNetworkError: ErrorType {
    // I just put here some idiotic error names
    // ... implement YOUR custom return errors here
    case NetworkResponseType1Error
    case NetworkResponseType2Error(message: String)
    case IncorrectDataReturned
}


//
// This is how a SignalProducer is defined in a proper way
// Wrap your async call using signals this way
//

class ExampleSignals {
    
    // NoError is a built-in type that, you guessed it, means the signal can’t error out.
    // I choose in this example NOT to return any error
    class func exampleNSURLSessionRequestSignal(url: NSURL) -> SignalProducer<AnyObject?, NoError> {
        
        return SignalProducer {
            observer, disposable in
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) -> Void in
                
                
                if let error = error {
                    // I print it but I don't return anything
                    // this is just an example
                    print("error: \(error.localizedDescription): \(error.userInfo)")
                }
                else {
                    // presume that data is good
                    if let data = data {
                        sendNext(observer, data)
                        sendCompleted(observer)
                    }
                }
                
                
            })
            
            // start network call
            task.resume()
            
            // when disposing, cancel network request
            disposable.addDisposable {
                task.cancel()
            }
            
        }
        
    }
    

    
    // My custom ErrorType Error
    class func exampleAlamofireRequestSignal() -> SignalProducer<AnyObject?, MyNetworkError> {
        
        return SignalProducer {
            observer, disposable in
            
            // launch your async method here
            // is this example we have an Alamofire network call, taken from their README
            
            let request = Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
                .validate()
                .response { request, response, data, error in
                    
                    if let error = error {
                        // error
                        print(error)
                        
                        // sendError of MyNetworkError type
                        sendError(observer, MyNetworkError.NetworkResponseType1Error)
                        // OR
                        // sendError(observer, MyNetworkError.NetworkResponseType2Error(message: "return something for the user"))
                    }
                    else {
                        // preliminary success, we don't have an error
                        // but still check for data
                        
                        guard let data = data, let _ = UIImage(data: data) else {
                            // guard tests that we have data and it can convert to an image
                            sendError(observer, .IncorrectDataReturned)
                            return
                        }
                        
                        // success
                        sendNext(observer, data)
                        sendCompleted(observer)
                    }
            }
            
            
            request.resume()
            disposable.addDisposable {
                request.cancel()
            }
            
        }
    }
    
    // end class
}



