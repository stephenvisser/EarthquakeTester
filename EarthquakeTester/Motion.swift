//
//  Motion.swift
//  EarthquakeTester
//
//  Created by Stephen Visser on 2016-02-12.
//  Copyright © 2016 Svper. All rights reserved.
//

import Foundation
import CoreMotion
import RxSwift

struct Motion {
    
    let motion: Observable<CMAcceleration>
    
    init() {
        let operationQueue = NSOperationQueue()
        let manager = CMMotionManager()
        manager.accelerometerUpdateInterval = 0.1

        motion = Observable.create { o in
            manager.startAccelerometerUpdatesToQueue(operationQueue) { data, error in
                if let e = error {
                    o.onError(e)
                } else if let d = data {
                    o.onNext(d.acceleration)
                }
                
            }
            return AnonymousDisposable {
                manager.stopAccelerometerUpdates()
            }
        }
            .publish()
            .refCount()
    }
}