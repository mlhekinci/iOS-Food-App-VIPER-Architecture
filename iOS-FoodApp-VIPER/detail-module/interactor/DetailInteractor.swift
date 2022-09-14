//
//  DetailInteractor.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation
import Alamofire

class DetailInteractor: PresenterToInteractorDetailProtocol {
    var detailPresenter: InteractorToPresenterDetailProtocol?
    
    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String) {
        
        var tempCount = yemek_siparis_adet
        let param = ["kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { res in
            if let data = res.data {
                do {
                    let result = try JSONDecoder().decode(SepetCevap.self, from: data)
                    
                    if let cartList = result.sepet_yemekler {
                        for item in cartList {
                            if (item.yemek_adi! == yemek_adi) {
                                self.deleteDuplicateOrder(orderId: item.sepet_yemek_id!, userName: kullanici_adi)
                                tempCount += Int(item.yemek_siparis_adet!)!
                            }
                        }
                        self.add(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: tempCount, kullanici_adi: kullanici_adi)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                    self.add(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
                }
            }
        }
    }
    
    private func deleteDuplicateOrder(orderId: String, userName: String) {
        let params = ["sepet_yemek_id": orderId, "kullanici_adi": userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response {res in
            
            if let data = res.data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    print("Deleted duplicated order: \(result)")
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    private func add(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String) {
        let params: Parameters = ["yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response {res in
            if let data = res.data {
                do {
                    if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if (response["success"] as? Int == 1) {
                            self.detailPresenter?.dataToPresenter(isSuccess: true)
                        }else {
                            self.detailPresenter?.dataToPresenter(isSuccess: false)
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
