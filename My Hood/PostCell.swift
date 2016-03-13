//
//  PostCell.swift
//  My Hood
//
//  Created by Russ Johnson on 3/13/16.
//  Copyright © 2016 Russ Johnson. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
  
  @IBOutlet weak var postImg: UIImageView!
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var descLbl: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    postImg.layer.cornerRadius = postImg.frame.size.width / 2
    postImg.clipsToBounds = true
  }
  
  func configureCell(post: Post) {
    titleLbl.text = post.title
    descLbl.text = post.postDescription
    postImg.image = DataService.instance.imageForPath(post.imagePath)
  }
  
}
