//
//  OptionsViewController.swift
//  BasicDrawing
//
//  Created by Sandy on 2019-02-15.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    var mainPage:ViewController?
    
    var currentShape:Shape? {
        didSet{
            // Set X and Y pos here!
            //canvasView.setNeedsDisplay()
            //LineColourChoice.set
            //FillColourChoice.set
        }
    }
    
    // ===============================================================
    // global variables
    // ===============================================================
    
    let myColours = ["blue":UIColor.blue,
                     "red":UIColor.red,
                     "green":UIColor.green,
                     "black":UIColor.black,
                     "orange":UIColor.orange,
                     "yellow":UIColor.yellow,
                     "purple":UIColor.purple,
                     "lightGray":UIColor.lightGray
                     ]
    
    
    // ===============================================================
    // on load
    // ===============================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmentColours(seg: LineColourChoice)
        setSegmentColours(seg: FillColourChoice)
        if currentShape != nil {
            LineWidthLabel.text = String(currentShape!.options.lineWidth)
            LineWidthSlider.setValue(Float(currentShape!.options.lineWidth), animated: true)
            doFillSwitch.setOn(currentShape!.options.isFill, animated: true)
            
            for (index, element) in myColours.enumerated() {
                if element.value == currentShape!.options.lineColor {
                    LineColourChoice.selectedSegmentIndex = index
                    break
                }
            }
            
            
            for (index, element) in myColours.enumerated() {
                if element.value == currentShape!.options.fillColor {
                    FillColourChoice.selectedSegmentIndex = index
                    break
                }
            }
            
            currentShape!.xStart = Double(canvasView.bounds.minX)
            currentShape!.yStart = Double(canvasView.bounds.minY)
            
            currentShape!.width = Double(canvasView.bounds.maxX - canvasView.bounds.minX)
            currentShape!.height = Double(canvasView.bounds.maxY - canvasView.bounds.minY)
            
            canvasView.shape = [currentShape!]
        }
        
    }
    
    // ============================================================
    // dynamically create the colours for a segment control
    // ============================================================
    func setSegmentColours(seg:UISegmentedControl){
        
        // start segmented section from scratch
        seg.removeAllSegments()
        
        // loop through all available colours and create the segment
        var segIndex = 0
        for (name,_) in myColours {
            seg.insertSegment(withTitle: "\(name)", at: segIndex, animated: false)
            segIndex=segIndex+1
        }
    }
    
    // ===============================================================
    // Gui Objects & events
    // ===============================================================
    @IBOutlet weak var LineWidthLabel: UILabel!
    @IBOutlet weak var LineWidthSlider:UISlider!
    @IBOutlet weak var FillColourChoice: UISegmentedControl!
    @IBOutlet weak var doFillSwitch: UISwitch!
    @IBOutlet weak var LineColourChoice: UISegmentedControl!
    
    @IBAction func cancelClick(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func lineWidthSliderChanged(_ sender: UISlider) {
        if currentShape != nil {
            LineWidthLabel.text = String(Int(sender.value))
            currentShape!.options.lineWidth = Int(sender.value)
            canvasView.shape = [currentShape!]
        }
    }
    
    @IBAction func OKClick(_ sender: UIButton) {
        if mainPage != nil, currentShape != nil {
            mainPage!.currentShape = self.currentShape!
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func LineColourChoiceClick(_ sender: UISegmentedControl) {
        if currentShape != nil {
            let colorChoice = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "black"
            let colorIndex = myColours.index(forKey: colorChoice)
            currentShape!.options.lineColor = myColours.values[colorIndex!]
            canvasView.shape = [currentShape!]
        }
    }
    @IBAction func FillColourChoiceClick(_ sender: UISegmentedControl) {
        if currentShape != nil {
            let colorChoice = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "white"
            let colorIndex = myColours.index(forKey: colorChoice)
            currentShape!.options.fillColor = myColours.values[colorIndex!]
            canvasView.shape = [currentShape!]
        }
    }
    @IBAction func doFillSwitchClick(_ sender: UISwitch) {
        if currentShape != nil {
            currentShape!.options.isFill = sender.isOn
            canvasView.shape = [currentShape!]
        }
    }
}
