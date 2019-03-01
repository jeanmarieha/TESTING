//
//  Line.swift
//  BasicDrawing
//
//  Created by Hamaoui, Jean-Marie on 2019-03-01.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class Line:Shape{
    
    override func draw(_ UIContext:CGContext){
        options.lineColor.setStroke()
        UIContext.setLineWidth(CGFloat(options.lineWidth))
        UIContext.move(to: CGPoint(x: xStart, y: yStart))
        UIContext.addLine(to: CGPoint(x: xStart + width, y: yStart + height))
        
        UIContext.strokePath()
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = Line(_options: options, _xStart: xStart, _yStart: yStart, _width: width, _height: height)
        return copy;
    }
}
