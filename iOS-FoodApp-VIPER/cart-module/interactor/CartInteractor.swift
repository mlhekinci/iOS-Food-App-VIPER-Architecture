//
//  CartInteractor.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation
import Alamofire

class CartInteractor: PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    func getAllCartList() {
        let param = ["kullanici_adi" : "order_test_user"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(SepetCevap.self, from: data)

                    if let list = result.sepet_yemekler {
                        self.cartPresenter?.dataToPresenter(cartList: list)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                    self.cartPresenter?.dataToPresenter(cartList: [])
                }
            }
        }
    }
    
    func deleteProduct(id: String) {
        let params = ["sepet_yemek_id": id, "kullanici_adi": "order_test_user"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { res in
            if let data = res.data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Delete Result: \(result)")
                    self.getAllCartList()
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
