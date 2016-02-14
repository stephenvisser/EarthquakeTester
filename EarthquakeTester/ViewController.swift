//
//  ViewController.swift
//  EarthquakeTester
//
//  Created by Stephen Visser on 2016-02-12.
//  Copyright © 2016 Svper. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    var xDirection: Driver<String>!
    var yDirection: Driver<String>!
    var zDirection: Driver<String>!
    
    @IBOutlet weak var x: UILabel! {
        didSet {
            xDirection.drive(x.rx_text).addDisposableTo(disposeBag)
        }
    }
    @IBOutlet weak var y: UILabel! {
        didSet {
            yDirection.drive(y.rx_text).addDisposableTo(disposeBag)
        }
    }
    @IBOutlet weak var z: UILabel! {
        didSet {
            zDirection.drive(z.rx_text).addDisposableTo(disposeBag)
        }
    }
}

