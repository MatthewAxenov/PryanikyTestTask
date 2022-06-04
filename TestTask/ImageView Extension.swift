//
//  ImageView Extension.swift
//  TestTask
//
//  Created by Матвей on 04.06.2022.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
