//
//  ArticleCell.swift
//  XebiaTest
//
//  Created by Ahmed Durrani on 28/03/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var imgOfArticle: UIImageView!
    @IBOutlet weak var lblTitleOfArticle: UILabel!
    @IBOutlet weak var lblAbstraction: UILabel!
    @IBOutlet weak var lblTypeOfArticle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
