//
//  DetailViewController.swift
//  DeviantArtBrowser
//
//  Created by Joshua Greene on 10/22/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet var imageView: UIImageView?
  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var titleLabel: UILabel!
  
  var item: RSSItem? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setImageViewImage()
    setTitleLabelText()
    setSubtitleLabelText()
  }
  
  func setImageViewImage() {
    
    if imageView == nil {
      return
    }
    
    let url = firstMediaContentImageURL()
    if url == nil {
      return
    }
    
    let request = NSURLRequest(URL: url!)
    
    self.activityIndicator.startAnimating()
    
    imageView!.setImageWithURLRequest(request, placeholderImage: nil,
      
      success: { (request, response, image) -> Void in
        self.activityIndicator.stopAnimating()
        self.imageView!.image = image

      }, failure: { (url, response, error) -> Void in
        self.activityIndicator.stopAnimating()
        self.imageView!.image = nil
    });
  }
  
  func firstMediaContentImageURL() -> NSURL? {
    for mediaContent in item?.mediaContents as! [RSSMediaContent] {
      if mediaContent.url != nil {
        return mediaContent.url
      }
    }
    return nil
  }
  
  func setTitleLabelText() {
    
    var title = item?.title
    
    if title == nil || (title!).characters.count == 0 {
      title = NSLocalizedString("[No Title]", comment: "")
    }
    
    titleLabel.text = title
  }
  
  func setSubtitleLabelText() {
    
    if let mediaText = item?.mediaText {
      subtitleLabel.text = mediaText
      
    } else if let mediaDescription = item?.mediaDescription {
      subtitleLabel.text = mediaDescription
      
    } else {
      subtitleLabel.text = ""
    }
  }
}
