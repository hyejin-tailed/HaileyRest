//
//  HMainTableViewCell.swift
//  haileyRest
//
//  Created by hailey on 3/13/19.
//  Copyright © 2019 hailey. All rights reserved.
//

import UIKit

class HMainTableViewCell: UITableViewCell {

    @IBOutlet var itemTitleLabel: UILabel!
    @IBOutlet var itemContentLabel: UITextView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }

    func configCell(title: String, content: String) {
        
        itemTitleLabel.text = title
        itemContentLabel.text = content
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
