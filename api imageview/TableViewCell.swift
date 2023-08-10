//
//  TableViewCell.swift
//  api imageview
//
//  Created by Admin on 09/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
