//
//  TestViewController.swift
//  Swift_NVActivityIndicatorView
//
//  Created by YU on 2017/1/5.
//  Copyright © 2017年 YU. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class       TestViewController:     UIViewController            {}
extension   TestViewController:     NVActivityIndicatorViewable {}

extension TestViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let random  = Int(arc4random_uniform(31)) + 1
        let size    = CGSize(width: 40, height:40)
        let type    = NVActivityIndicatorType(rawValue: random)!
        
        startAnimating(size, message: "Loading", type:type)
        perform(#selector(delayedStopActivity), with: nil, afterDelay: 1.0)
    }
    
    func delayedStopActivity() { stopAnimating() }
    
}
