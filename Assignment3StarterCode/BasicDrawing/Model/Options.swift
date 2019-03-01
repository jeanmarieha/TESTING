//
//  Options.swift
//  BasicDrawing
//
//  Created by Hamaoui, Jean-Marie on 2019-03-01.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

struct Options{
    var lineWidth:Int
    var fillColor:UIColor
    var isFill:Bool
    var lineColor:UIColor
    
    init(_lineWidth:Int = 1, _fillColor:UIColor = UIColor.white, _isFill:Bool = false, _lineColor:UIColor = UIColor.black){
        lineWidth = _lineWidth
        fillColor = _fillColor
        isFill = _isFill
        lineColor = _lineColor
    }
    
    func draw(){
        
    }
}
