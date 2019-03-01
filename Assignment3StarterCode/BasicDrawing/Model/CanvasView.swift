//
//  CanvasView.swift
//  BasicDrawing
//
//  Created by Hamaoui, Jean-Marie on 2019-03-01.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    var shape:[Shape]? {
        didSet{
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        
        if let context = UIGraphicsGetCurrentContext(), shape != nil {
            for index in 0..<shape!.count{
                shape![index].draw(context)
            }
        }
    }
}
