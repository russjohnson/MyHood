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
      
    }
  
  func configureCell(post: Post) {
    titleLbl.text = post.title
    descLbl.text = post.postDescription
    
  }

}
