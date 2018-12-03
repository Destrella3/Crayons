//
//  CrayonDetailViewController.swift
//  Crayons
//
//  Created by Diego Estrella III on 12/3/18.
//  Copyright © 2018 Diego Estrella III. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    public var crayon: Crayon!
    
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    @IBAction func sliderChange(_ sender: UISlider) {
        updateColor()
    }
    
    
    @IBAction func stepperChange(_ sender: UIStepper) {
        updateColor()
    }
    
    
    @IBAction func resetColor(_ sender: UIButton) {
        defaultValues()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = crayon.color()
        defaultValues()
        updateLabels()
        resetColor(resetButton)
    }
    
    private func updateLabels() {
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
        alphaLabel.text = String(format: "%.1f", alphaStepper.value)
    }
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaStepper.value)
        let color = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = color
        updateLabels()
    }
    private func defaultValues() {
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        alphaStepper.value = 1
    }
}
