//
//  TranscriptCell.swift
//  HTSAS
//
//  Created by Domenico on 29/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class TranscriptCell: UITableViewCell {
    @IBOutlet var captionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
        
        self.captionLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.captionLabel.frame)
    }
    
}
