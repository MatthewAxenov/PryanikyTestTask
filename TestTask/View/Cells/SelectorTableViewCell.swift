//
//  SelectorTableViewCell.swift
//  TestTask
//
//  Created by Матвей on 04.06.2022.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {

    @IBOutlet weak var dataTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var variant: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: Datum) {
        self.dataTextLabel.text = model.data.variants![variant].text
        self.nameLabel.text = "Объект - " + model.name
    }
    
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        self.variant = sender.selectedSegmentIndex
        print(variant)
    }
    
    
    
    

}
