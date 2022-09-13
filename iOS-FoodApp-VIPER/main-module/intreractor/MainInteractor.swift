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
    
    func getFoodCountOfBasket(userName: String) {
        let param = ["kullanici_adi": userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { res in
            if let data = res.data {
                do {
                    let result = try JSONDecoder().decode(SepetCevap.self, from: data)
                    self.mainPresenter?.dataToPresenter(foodCount: result.sepet_yemekler?.count ?? 0)
                }catch {
                    print(error.localizedDescription)
                    self.mainPresenter?.dataToPresenter(foodCount: 0)
                }
            }
        }
    }
}
