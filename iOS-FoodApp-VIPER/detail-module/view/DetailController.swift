//
//  DetailController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 5.09.2022.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var foods: Yemekler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let food = foods {
            self.navigationItem.title = "View \(food.yemek_adi!) Product"
            foodImage.setNetworkImage(imageName: food.yemek_resim_adi!)
            titleLabel.text = food.yemek_adi!
            priceLabel.text = "\(food.yemek_fiyat!) ₺"
        }
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
        
    }
}
