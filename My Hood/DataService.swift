//
//  DataService.swift
//  My Hood
//
//  Created by Russ Johnson on 3/13/16.
//  Copyright © 2016 Russ Johnson. All rights reserved.
//

import Foundation
import UIKit

class DataService {
  
  static let instance = DataService()
  
  let KEY_POSTS = "posts"
  private var _loadedPosts = [Post]()
  
  var loadedPosts: [Post] {
    return _loadedPosts
  }
  
  
  func savePosts() {
    let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
    NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
    NSUserDefaults.standardUserDefaults().synchronize()
  }
  
  
  func loadPosts() {
    if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
      if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
        _loadedPosts = postsArray
      }
    }
    NSNotificationCenter.defaultCenter() .postNotification(NSNotification(name: "postsLoaded", object: nil))
  }
  
  
  func saveImageAndCreatePath(image: UIImage) -> String {
    let imgData = UIImagePNGRepresentation(image)
    let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
    let fullPath = documentsPathForFilename(imgPath)
    imgData?.writeToFile(fullPath, atomically: true)
    return imgPath
  }
  
  
  func imageForPath(path: String) -> UIImage? {
    let fullPath = documentsPathForFilename(path)
    let image = UIImage(named: fullPath)
    return image
  }
  
  
  func createPost(post: Post) {
    _loadedPosts.append(post)
    savePosts()
    loadPosts()
  }
  
  
  func documentsPathForFilename(name: String) -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    let fullPath = paths[0] as NSString
    return fullPath.stringByAppendingPathComponent(name)
  }
  
}