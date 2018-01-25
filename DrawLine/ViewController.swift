//
//  ViewController.swift
//  DrawLine
//
//  Created by Neo Nguyen on 1/25/18.
//  Copyright © 2018 Neo Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak fileprivate var vDrawView : DrawView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var points = [CGPoint.init(x: 20 , y: 20),
                      CGPoint.init(x: 50, y: 100),
                      CGPoint.init(x: 100, y: 150),
                      CGPoint.init(x: 150, y: -100),
                      CGPoint.init(x: 160, y: -90),
                      CGPoint.init(x: 200, y: 100)
                      ]
        //Convert point
        for index in 0..<points.count{
            var point = points[index]
            point.y = point.y + 300
            points[index] = point
        }
        // Do any additional setup after loading the view, typically from a nib.
        self.vDrawView.points = points
    }
}

