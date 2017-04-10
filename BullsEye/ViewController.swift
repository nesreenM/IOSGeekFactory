//
//  ViewController.swift
//  BullsEye
//
//  Created by Nesreen Mamdouh on 4/8/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var slider: UISlider!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var hitMeBtn:  UIButton!

    var targetValue:Int = 0
    var currentValue = 0
    var score: Int = 0
    var roundNumber = 0
    var scoreString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        setLabels()
        
        hitMeBtn.backgroundColor = UIColor.yellow
        hitMeBtn.layer.cornerRadius = 5
        hitMeBtn.layer.borderWidth = 1
        
        slider.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
        
        
        slider.setThumbImage(UIImage(named: "SliderThumb-Highlighted"), for: .highlighted)
        slider.setMaximumTrackImage(UIImage(named: "SliderTrackRight")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 20, 0, 20)), for: .normal )
        slider.setMinimumTrackImage(UIImage(named: "SliderTrackLeft")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 20, 0, 20)), for: .normal)
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        
        calculateScore()
        startNewRound()
        setLabels()

        
        let alert = UIAlertController(title: "\(scoreString)", message: "you scored\(score)\n your value is \(currentValue)\n the target value is \(targetValue)", preferredStyle : .alert)
        
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider ){
    
        print("The value of the slider is \(slider.value)")
        
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func resetButton(){
        
        score = 0
        roundNumber = 0
        
        setLabels()
        
    }
    
    func startNewRound(){
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)

    }
    
    func setLabels(){
        
        targetLabel.text = String(targetValue)
        roundNumber += 1
        roundLabel.text = String(roundNumber)
        scoreLabel.text = String(score)
        
    }

    func calculateScore(){
        
        let difference  = abs(currentValue - targetValue)
        
        score = abs(100 - difference)
        if(difference == 0)
        {
            score += 100
            scoreString = "Perfect!"
        }
        else if(difference < 5){
            score += 50
            scoreString = "You almost had it!"
            
        }
        else if(difference < 10)
        {
            scoreString = "Pretty good"
        }
        else{
            scoreString = "Not even close"
 
        }
        
    }


}

