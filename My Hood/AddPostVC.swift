//
//  AddPostVC.swift
//  My Hood
//
//  Created by Russ Johnson on 3/13/16.
//  Copyright © 2016 Russ Johnson. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  @IBOutlet var postImg: UIImageView!
  @IBOutlet var titleField: UITextField!
  @IBOutlet var descField: UITextField!
  
  var imagePicker: UIImagePickerController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    postImg.layer.cornerRadius = postImg.frame.size.width / 2
    postImg.clipsToBounds = true
    
    imagePicker = UIImagePickerController()
    imagePicker.delegate = self
  }
  
  
  @IBAction func cancelBtnPressed(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  @IBAction func addPicBtnPressed(sender: UIButton) {
    sender.setTitle("", forState: .Normal)
    presentViewController(imagePicker, animated: true, completion: nil)
  }
  
  
  @IBAction func saveBtnPressed(sender: AnyObject) {
    if let title = titleField.text, let descField = descField.text, let img = postImg.image {
      
      let imgPath = DataService.instance.saveImageAndCreatePath(img)
      var post = Post(imagePath: imgPath, title: title, description: descField)
      DataService.instance.createPost(post)
      dismissViewControllerAnimated(true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    imagePicker.dismissViewControllerAnimated(true, completion: nil)
    postImg.image = image
  }
  
}
