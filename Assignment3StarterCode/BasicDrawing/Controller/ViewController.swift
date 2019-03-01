//
//  ViewController.swift
//  BasicDrawing
//
//  Created by Sandy on 2019-02-14.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentShape:Shape = Rectangle()
    private var shapesArray = [Shape]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func shapeChosen(_ sender: UISegmentedControl) {
        
        let lastOptions:Options = currentShape.options
        
        switch(sender.titleForSegment(at: sender.selectedSegmentIndex)){
            case "Rect":
                currentShape = Rectangle(_options: lastOptions)
                break
            case "Oval":
                currentShape = Oval(_options: lastOptions)
                break
            case "Line":
                currentShape = Line(_options: lastOptions)
                break
        default:
            currentShape = Rectangle(_options: lastOptions)
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "optionsSegue"{
            let secondPage = segue.destination as! OptionsViewController
            secondPage.mainPage = self
            secondPage.currentShape = currentShape.copy() as? Shape
        }
    }
    
}

