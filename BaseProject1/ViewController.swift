//
//  ViewController.swift
//  BaseProject1
//
//  Created by Andrei on 07/10/15.
//  Copyright © 2015 ALT TAB Mobile. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveCocoa

// master change A 

//
// This is how a SignalProducer is defined in a proper way
// Wrap your async call using signals this way
//


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func useExampleSignal() {
        
        // The HTTP request isn't started until start() has been called on the SignalProducer
        // Each invocation of start() on the same SignalProducer causes a new HTTP request to be started
        ExampleSignals.exampleAlamofireRequestSignal()
            .start(Event.sink(
                error: { error in
                    print("error!");
                },
                completed: {
                    print("completed!");
                }
                , interrupted: {
                    print("interrupted");
                }
                , next: { value in
                    print("received ", value);
            }))
        
        // signal response can be handled also with switch statement
        ExampleSignals.exampleAlamofireRequestSignal()
            .start { event in
                
                switch event {
                case .Next(let data):
                    print("received ", data);
                case .Error:
                    print("error!");
                case .Completed:
                    print("completed!");
                case .Interrupted:
                    print("interrupted");
                }
        }
        
        
    }


}

