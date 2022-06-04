//
//  ImageTableViewCell.swift
//  TestTask
//
//  Created by Матвей on 04.06.2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: Datum) {
        
        self.dataTextLabel.text = model.data.text
        self.nameLabel.text = "Объект - " + model.name
        self.dataImage.setImage(imageUrl: model.data.url!)
        self.nameLabel.isHidden = true
    }

    @IBAction func cellPressed(_ sender: Any) {
        self.nameLabel.isHidden = !self.nameLabel.isHidden
    }
}
