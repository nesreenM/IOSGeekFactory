//
//  ViewController.swift
//  MemoryGame
//
//  Created by Nesreen Mamdouh on 4/16/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    var firstbtnImage :UIImage!
    var secondbtnImage :UIImage!
    var firtbtn : UIButton!
    var secondbtn : UIButton!
    var score :Int = 0

    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func resetGame(){
    for  btn in buttons{
        btn.imageView?.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = UIColor.black.cgColor
        btn.isEnabled = true;
        }
    score = 0
    }
    
    @IBAction func matchColors(_ sender: UIButton) {

        if counter == 0 {
            
            firstbtnImage = sender.currentImage
            firtbtn = sender
            firtbtn.imageView?.layer.transform = CATransform3DIdentity
            counter = 1
            
        }
        else if counter == 1 {
            secondbtnImage = sender.currentImage
            secondbtn = sender
            secondbtn.imageView?.layer.transform = CATransform3DIdentity
            
            let deadlineTime = DispatchTime.now() + .seconds(1)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
           
                
                if self.firtbtn.isEqual(self.secondbtn){
                    print("please choose another button")
                }
                else if self.firstbtnImage.isEqual(self.secondbtnImage){
                    print("same butons woho")
                    self.secondbtn.isEnabled = false;
                    self.firtbtn.isEnabled = false;
                    self.counter = 0
                    self.score = self.score + 1
                    print(self.score)
                    if self.score == 8 {
                        print("you won")
                        let alert = UIAlertController(title: "Memory", message: "Great memory! you won :D", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (action) -> Void in
                            self.resetGame()
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                else{
                    print("try again")
                    self.firtbtn.imageView?.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
                    self.secondbtn.imageView?.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
                    self.counter = 0
                    
                }
            }
           

        }
        
        
        
        
    }


}

