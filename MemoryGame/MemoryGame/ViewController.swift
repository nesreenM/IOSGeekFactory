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
    let coverImage =  #imageLiteral(resourceName: "card back black_0.png")
    var arrayImageInd  = [#imageLiteral(resourceName: "4_of_spades"),#imageLiteral(resourceName: "2_of_spades"),#imageLiteral(resourceName: "ace_of_spades"),#imageLiteral(resourceName: "jack_of_clubs2"),#imageLiteral(resourceName: "king_of_clubs2"),#imageLiteral(resourceName: "red_joker"),#imageLiteral(resourceName: "8_of_diamonds"),#imageLiteral(resourceName: "10_of_clubs"),
                          #imageLiteral(resourceName: "2_of_spades"),#imageLiteral(resourceName: "ace_of_spades"),#imageLiteral(resourceName: "8_of_diamonds"),#imageLiteral(resourceName: "10_of_clubs"),#imageLiteral(resourceName: "jack_of_clubs2"),#imageLiteral(resourceName: "red_joker"),#imageLiteral(resourceName: "king_of_clubs2"),#imageLiteral(resourceName: "4_of_spades")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func resetButton(_ sender: Any) {
        resetGame()
    }
    @IBAction func infoButton(_ sender: Any) {
        let alert = UIAlertController(title: "Memory", message: "Try to select 2 different cards that have the same image", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Lets Play", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Quit Game", style: .default, handler: { (action) -> Void in
            exit(0)
        }))
        present(alert, animated: true, completion: nil)
    }
    
   func resetGame(){
    for  btn in buttons{
        
        btn.setImage(coverImage, for: .normal)
        btn.isEnabled = true;
        }
    score = 0
    }
    
    @IBAction func matchColors(_ sender: UIButton) {

        let index =  buttons.index(of: sender)
       
       
        if counter == 0 {
           
            UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: {
                sender.setImage(self.arrayImageInd[index!], for: .normal)
            }, completion: nil)

            firstbtnImage = sender.currentImage
            firtbtn = sender
            firtbtn.imageView?.layer.transform = CATransform3DIdentity
            counter = 1
            
        }
        else if counter == 1 {
           
            UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: {
                sender.setImage(self.arrayImageInd[index!], for: .normal)
            }, completion: nil)

            secondbtnImage = sender.currentImage
            secondbtn = sender
            secondbtn.imageView?.layer.transform = CATransform3DIdentity
            
            let deadlineTime =  DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
           
            if self.firstbtnImage.isEqual(self.secondbtnImage) && !self.firtbtn.isEqual(self.secondbtn){
                    self.secondbtn.isEnabled = false;
                    self.firtbtn.isEnabled = false;
                    self.counter = 0
                    self.score = self.score + 1
                    if self.score == 8 {
                        let alert = UIAlertController(title: "Memory", message: "Great memory! you won :D", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (action) -> Void in
                            self.resetGame()
                        }))
                        alert.addAction(UIAlertAction(title: "Quit Game", style: .default, handler: { (action) -> Void in
                            exit(0)
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                else{
                UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: {
                    self.firtbtn.setImage(self.coverImage, for: .normal)

                }, completion: nil)
                UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: {
                    self.secondbtn.setImage(self.coverImage, for: .normal)
                    
                }, completion: nil)
                
                }
            }
            self.counter = 0

           

        }
        
        
        
        
    }


}

