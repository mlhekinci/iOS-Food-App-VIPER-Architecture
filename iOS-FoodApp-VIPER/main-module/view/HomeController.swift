//
//  ViewController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import UIKit

class HomeController: UIViewController {
    
    var mainPresenterObject: ViewToPresenterMainProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainRouter.createModule(ref: self)
    }
}

extension HomeController: PresenterToViewMainProtocol {
    func dataToView(foodList: Array<Food>) {
        
    }
}

