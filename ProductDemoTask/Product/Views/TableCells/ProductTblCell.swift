//
//  ProductTblCell.swift
//  ProductDemoTask
//
//  Created by CM on 14/07/23.
//

import UIKit

class ProductTblCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
