//
//  SecondVC.swift
//  AnimationDemo
//
//  Created by Capgemini_DA078 on 5/27/22.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var imageL: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backClick(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func selectClick(_ sender: Any) {
        
        let picker  = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
       picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func shareClick(_ sender: Any) {
        
        let  itemsToShare = [imageL.image]
        
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}
extension SecondVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let url = info[.imageURL] as? URL {
            print("Image selected : \(url.absoluteString)")
            
            do{
               let imgData = try Data(contentsOf: url)
               imageL.image = UIImage(data: imgData)
            }catch {
                print("ERROR: \(error.localizedDescription)")
            }
        
        picker.dismiss(animated: true, completion: nil)
    }
   
        

           func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

           

               print("No image selected")

               picker.dismiss(animated: true, completion: nil)

           }

       }
}
