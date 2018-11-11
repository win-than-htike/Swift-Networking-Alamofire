//
//  NewsTableViewCell.swift
//  Network-Alamofire-SwiftyJson-SDWebImage
//
//  Created by Win Than Htike on 11/10/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var ivNewsImage: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsReleasedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
