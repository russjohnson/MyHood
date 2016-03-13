//
//  ViewController.swift
//  My Hood
//
//  Created by Russ Johnson on 3/13/16.
//  Copyright © 2016 Russ Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!

  var posts = [Post]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    let post1 = Post(imagePath: "", title: "Post 1", description: "Deescription")
    let post2 = Post(imagePath: "", title: "Post 2", description: "Deescription")
    let post3 = Post(imagePath: "", title: "Post 3", description: "Deescription for cell numma 3")
    
    posts.append(post1)
    posts.append(post2)
    posts.append(post3)
    
    tableView.reloadData()
  }
  
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let post = posts[indexPath.row]
    
    if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
      cell.configureCell(post)
      return cell
    } else {
      let cell = PostCell()
      cell.configureCell(post)
      return cell
    }
    
  }
  
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 92.0
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
//  Implement this for how to handle selecting a row
//  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//    
//  }

}

