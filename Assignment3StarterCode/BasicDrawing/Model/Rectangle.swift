
//
//  Rectangle.swift
//  BasicDrawing
//
//  Created by Hamaoui, Jean-Marie on 2019-03-01.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class Rectangle:Shape{
    
    override func draw(_ UIContext: CGContext){
        options.fillColor.setFill()
        options.lineColor.setStroke()
        UIContext.setLineWidth(CGFloat(options.lineWidth))
        
        if options.isFill {
            UIContext.addRect(CGRect(x: xStart, y: yStart, width: width, height: height))
            UIContext.fillPath()
        }
        
        UIContext.addRect(CGRect(x: xStart, y: yStart, width: width, height: height))
        UIContext.strokePath()
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = Rectangle(_options: options, _xStart: xStart, _yStart: yStart, _width: width, _height: height)
        return copy;
    }
}
