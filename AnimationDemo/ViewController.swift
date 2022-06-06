//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Capgemini_DA078 on 5/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeL: UILabel!

    @IBOutlet weak var img: UIImageView!
    let newImg = UIImageView(image: UIImage(systemName: "person"))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    }
    
    @IBAction func colorClick(_ sender: Any) {
        
        UIView.animate(withDuration: 10, delay: 0, options: []) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.view.backgroundColor = .blue
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.5) {
                self.view.backgroundColor = .yellow
   
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.5) {
                self.view.backgroundColor = .green
            }
                   
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.5) {
                self.view.backgroundColor = .gray
            }
        
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.5) {
            self.view.backgroundColor = .red
        }
        
    }completion: { _ in
        }
    }

    @IBAction func shakeClick(_ sender: Any) {
        let originalBounds = img.bounds
        
        UIView.animate(withDuration: 10, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [.curveEaseInOut]) {
            
            self.img.bounds = CGRect(x: originalBounds.origin.x - 20, y: originalBounds.origin.y, width: originalBounds.width + 100, height: originalBounds.height + 60)
        } completion: { _ in
            
        }
    }
    
    @IBAction func moveLabel(_ sender: Any) {
        let originalY = welcomeL.center.y
        
        UIView.animate(withDuration: 10, delay: 0, options: [.repeat, .autoreverse], animations: {
             
            let toAdd = self.view.bounds.height - originalY - 40
            self.welcomeL.center.y += toAdd
        }, completion: {_ in
            self.welcomeL.center.y = originalY
        })
    }
       
    override func viewWillAppear(_ animated: Bool) {
        img.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 5, delay: 1, options: [.repeat, .autoreverse]) {
            self.img.alpha = 1
        }

    }
    @IBAction func addClick(_ sender: Any) {
     //add new imageView
        
        let  bounds = img.bounds
        
       
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCurlUp]) {
      
        
            self.newImg.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y + 500, width: 300, height: 300)
           
            self.view.addSubview(self.newImg)
        
        }completion: {_ in
        
           //newImg.removeFromSuperview()
            
    }
        
        
    }
    
        @IBAction func replaceClick(_ sender: Any) {
  //replace imagView with empty view with BLUE color
            
           let blueBox = UIView(frame: newImg.frame)
           blueBox.backgroundColor = .blue
           
            let anotherImg = UIImageView(frame: newImg.frame)
            anotherImg.image = UIImage(systemName: "folder")
            
            UIView.transition(from: newImg, to: anotherImg, duration: 10, options: [.transitionFlipFromBottom])  { _ in
          
            }
        }
    
    @IBAction func startClick(_ sender: Any) {
        
      //  let animImage = UIImage.animatedImage(with: [UIImage(systemName: "person")!,UIImage(systemName: "tray")!,UIImage(systemName: "folder")!], duration: 10)
    
       // img.image = animImage
   //img.tintColor = .brown
   
        
        //Using Timer
      var counter = 0
    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
         
          let idx = counter % 5
          
          switch idx {
          case 0 :
              self.img.image = UIImage(systemName: "person")
          case 1 :
              self.img.image = UIImage(systemName: "pencil")
          case 2 :
              self.img.image = UIImage(systemName: "arrow.up.heart")
          case 3 :
              self.img.image = UIImage(systemName: "folder")
          case 4 :
              self.img.image = UIImage(systemName: "tray")
         default:
              //stop timer
                  timer.invalidate()
                  
              }
          counter += 1
    }
    
}

    @IBAction func continueClick(_ sender: Any) {
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "secondscreen"))!
        
      vc.modalPresentationStyle = .fullScreen // for patialCurl
      vc.modalTransitionStyle = .flipHorizontal
        
      //  vc.modalPresentationStyle = .popover
        //vc.popoverPresentationController?.sourceView = sender as! UIView
 
        present(vc, animated: true,completion: nil)
    }
}
