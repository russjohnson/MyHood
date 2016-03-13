//
//  Post.swift
//  My Hood
//
//  Created by Russ Johnson on 3/13/16.
//  Copyright © 2016 Russ Johnson. All rights reserved.
//

import Foundation

class Post {
  
  private var _imagePath: String
  private var _title: String
  private var _postDescription: String
  
  
  var imagePath:String {
    return _imagePath
  }
  
  var title: String {
    return _title
  }
  
  var postDescription: String {
    return _postDescription
  }
  
  init(imagePath: String, title: String, description: String) {
    self._imagePath = imagePath
    self._title = title
    self._postDescription = description
  }
  
  
  
}