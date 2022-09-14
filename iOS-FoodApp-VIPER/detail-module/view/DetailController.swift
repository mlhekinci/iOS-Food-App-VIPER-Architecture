//
//  DetailController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 5.09.2022.
//

import UIKit

class DetailController: UIViewController {
    
    var foods: Yemekler?
    var detailPresenterObject: ViewToPresenterDetailProtocol?
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailRouter.createModule(ref: self)
       
        stepper.value = 1
        countLabel.text = "Quantitiy: \(Int(stepper.value))"
        totalPriceLabel.text = "Total: \((foods?.yemek_fiyat!)!) ₺"
        
        if let food = foods {
            self.navigationItem.title = "View \(food.yemek_adi!) Product"
            foodImage.setNetworkImage(imageName: food.yemek_resim_adi!)
            titleLabel.text = food.yemek_adi!
            priceLabel.text = "\(food.yemek_fiyat!) ₺"
        }
    }
    

    @IBAction func stepperControl(_ sender: UIStepper) {
        countLabel.text = "Quantitiy: \(Int(sender.value))"
        totalPriceLabel.text =  "Total: \( Int(sender.value) * Int((foods?.yemek_fiyat)!)!)₺"
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
        detailPresenterObject?.add(yemek_adi: (foods?.yemek_adi)!, yemek_resim_adi: (foods?.yemek_resim_adi)!, yemek_fiyat: (foods?.yemek_fiyat)!, yemek_siparis_adet: Int(self.stepper.value), kullanici_adi: "order_test_user")
    }
}

extension DetailController : PresenterToViewDetailProtocol {
    func dataToView(isSuccess: Bool) {

        print(isSuccess)
        
        let alert = UIAlertController(title: "Food Delivery", message: "The product has been successfully added to the cart", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Continue Shopping", style: .default) { action in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        let cartAction = UIAlertAction(title: "View My Cart", style: .default) {action in
            self.performSegue(withIdentifier: "toCart", sender: nil)
        }
        
        alert.addAction(okAction)
        alert.addAction(cartAction)
        
        if (isSuccess) {
            present(alert, animated: true)
        }
    }
}
