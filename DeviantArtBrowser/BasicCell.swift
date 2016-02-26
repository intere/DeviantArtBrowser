//
//  BasicCell.swift
//  DeviantArtBrowser
//
//  Created by Eric Internicola on 2/26/16.
//  Copyright © 2016 Razeware, LLC. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
