//
//  Shape.swift
//  BasicDrawing
//
//  Created by Hamaoui, Jean-Marie on 2019-03-01.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class Shape: NSCopying{
    var options:Options
    var xStart:Double
    var yStart:Double
    var width:Double
    var height:Double
    
    func draw(_ UIContext: CGContext){
        options.fillColor.setFill()
        options.lineColor.setStroke()
        UIContext.addRect(CGRect(x: xStart, y: yStart, width: width, height: height))
        UIContext.setLineWidth(CGFloat(options.lineWidth))
        if options.isFill {
            UIContext.fillPath()
        }
        UIContext.strokePath()
    }
    
    init(_options: Options = Options(), _xStart: Double = 10.0, _yStart:Double = 10.0, _width:Double = 10.0, _height:Double = 10.0){
        options = _options
        xStart = _xStart
        yStart = _yStart
        width = _width
        height = _height
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Shape(_options: options, _xStart: xStart, _yStart: yStart, _width: width, _height: height)
        return copy;
    }
}
