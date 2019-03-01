//
//  Oval.swift
//  BasicDrawing
//
//  Created by Hamaoui, Jean-Marie on 2019-03-01.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class Oval:Shape{
    override func draw(_ UIContext:CGContext){
        self.options.fillColor.setFill()
        self.options.lineColor.setStroke()
        UIContext.setLineWidth(CGFloat(self.options.lineWidth))
        
        if self.options.isFill {
            
            UIContext.addArc(center: CGPoint(x: (xStart + width)/2, y: (yStart + height)/2), radius: CGFloat(width/4), startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            UIContext.fillPath()
        }
        
        UIContext.addArc(center: CGPoint(x: (xStart + width)/2, y: (yStart + height)/2), radius: CGFloat(width/4), startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        UIContext.strokePath()
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = Oval(_options: options, _xStart: xStart, _yStart: yStart, _width: width, _height: height)
        return copy;
    }
}
