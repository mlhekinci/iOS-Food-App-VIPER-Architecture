//
//  MainInteractor.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import Foundation
import Alamofire


class MainInteractor : PresenterToInteractorMainProtocol {
    
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    func getFoodList() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                
                do {
                    let result = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    
                    if let foodList = result.yemekler {
                        self.mainPresenter?.dataToPresenter(foodList: foodList)
                    }
                    
                }catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
