//
//  ViewController.swift
//  Swift_NVActivityIndicatorView
//
//  Created by YU on 2017/1/5.
//  Copyright © 2017年 YU. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cols = 4
        let rows = 8
        let cellWidth = Int((self.view.frame.width - 20) / CGFloat(cols))
        let cellHeight = Int((self.view.frame.height - 20) / CGFloat(rows))
        
        (NVActivityIndicatorType.ballPulse.rawValue ... NVActivityIndicatorType.audioEqualizer.rawValue).forEach {
            let x = ($0 - 1) % cols * cellWidth + 20
            let y = ($0 - 1) / cols * cellHeight + 20
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,type: NVActivityIndicatorType(rawValue: $0)!, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            let animationTypeLabel = UILabel(frame: frame)
            
            animationTypeLabel.text = String($0)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
            
            activityIndicatorView.padding = 20
            if ($0 == NVActivityIndicatorType.orbit.rawValue) {
                activityIndicatorView.padding = 0
            }
            self.view.addSubview(activityIndicatorView)
            self.view.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimating()
            
            let button:UIButton = UIButton(frame: frame)
            button.tag = $0
            button.addTarget(self,
                             action: #selector(buttonTapped(_:)),
                             for: UIControlEvents.touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func buttonTapped(_ sender: UIButton) {
        let size = CGSize(width: 30, height:30)
        
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: sender.tag)!)
        perform(#selector(delayedStopActivity),
                with: nil,
                afterDelay: 1.5)
    }
    
    func delayedStopActivity() {
        stopAnimating()
    }
    
}

