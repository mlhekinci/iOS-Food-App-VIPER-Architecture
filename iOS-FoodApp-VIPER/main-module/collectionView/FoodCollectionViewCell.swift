//
//  FoodCollectionViewCell.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 5.09.2022.
//

import UIKit
import Kingfisher

class FoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
        func showImage(imageName: String) {
            image.setNetworkImage(imageName: imageName)
    }
}
