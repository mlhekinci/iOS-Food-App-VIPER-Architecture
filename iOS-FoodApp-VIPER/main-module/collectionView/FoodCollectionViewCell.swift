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
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.image.kf.setImage(with: url)
            }
        }
    }
}
