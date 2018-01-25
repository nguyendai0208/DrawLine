//
//  DrawView.swift
//  DrawLine
//
//  Created by Neo Nguyen on 1/25/18.
//  Copyright © 2018 Neo Nguyen. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var points : [CGPoint] = [CGPoint]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(2)
        context.move(to: points[0])
        if points.count == 2{
            context.addLine(to: points[1])
            context.strokePath()
            return
        }
        var p1 = points[0]
        for index in 1..<points.count {
            let point = points[index]
            let midPoint = self.midPointForPoints(p1: p1, p2: point)
            context.addQuadCurve(to: midPoint, control: controlPointForPoints(p1: midPoint, p2: p1))
            context.addQuadCurve(to: point, control: controlPointForPoints(p1: midPoint, p2: point))
            p1 = point
        }
        context.strokePath()
        
        self.drawPoints(points: points)
    }

    fileprivate func midPointForPoints(p1 : CGPoint, p2 : CGPoint)  -> CGPoint{
        return CGPoint.init(x: (p1.x + p2.x)/2.0, y: (p1.y + p2.y)/2.0)
    }
    
    fileprivate func controlPointForPoints(p1 : CGPoint, p2 : CGPoint) -> CGPoint{
        var controlPoint = midPointForPoints(p1: p1, p2: p2)
        let diffY = abs(p2.y - controlPoint.y)
        if (p1.y < p2.y){
            controlPoint.y += diffY
        }else if (p1.y > p2.y){
            controlPoint.y -= diffY
        }
        return controlPoint
    }
    
    private func drawPoints(points: [CGPoint]){
        
        
        for point in points {
            
            let path = UIBezierPath(ovalIn: CGRect(x        : point.x - 5,
                                                   y        : point.y - 5,
                                                   width    : 10,
                                                   height   : 10))
            UIColor.green.withAlphaComponent(0.5).setFill()
            path.fill()
        }
    }
}
