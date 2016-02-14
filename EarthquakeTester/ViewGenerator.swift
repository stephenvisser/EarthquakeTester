//
//  ViewGenerator.swift
//  EarthquakeTester
//
//  Created by Stephen Visser on 2016-02-13.
//  Copyright © 2016 Svper. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreMotion

private enum Direction {
    case X
    case Y
    case Z
    
    func description(acc: CMAcceleration) -> String {
        let num: Double
        switch self {
        case X: num = acc.x
        case Y: num = acc.y
        case Z: num = acc.z
        }
        return NSString(format: "%.5f", num) as String
    }
}

func ViewGenerator(storyboard: UIStoryboard, navigate: (UIViewController) -> Void) {

    let vc = storyboard.instantiateViewControllerWithIdentifier(String(ViewController)) as! ViewController

    let motion = Motion()
    
    vc.xDirection = motion.motion.map(Direction.X.description).asDriver(onErrorJustReturn: "Error!")
    vc.yDirection = motion.motion.map(Direction.Y.description).asDriver(onErrorJustReturn: "Error!")
    vc.zDirection = motion.motion.map(Direction.Z.description).asDriver(onErrorJustReturn: "Error!")
    
    navigate(vc)
}