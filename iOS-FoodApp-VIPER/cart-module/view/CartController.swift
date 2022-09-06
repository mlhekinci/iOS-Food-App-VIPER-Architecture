//
//  CartController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import UIKit

class CartController: UIViewController {
    
    var cartPresenterObject: ViewToPresenterCartProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        CartRouter.createModule(ref: self)
    }
}

extension CartController: PresenterToViewCartProtocol {
    func dataToView(cartList: Array<Sepet>) {
    }
}
