//
//  CartController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import UIKit

class CartController: UIViewController {
    
    var cartPresenterObject: ViewToPresenterCartProtocol?
    var cartList = [Sepet]()
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CartRouter.createModule(ref: self)
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
}

extension CartController: PresenterToViewCartProtocol {
    func dataToView(cartList: Array<Sepet>) {
    }
}

extension CartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = cartList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        cell.productImage.setNetworkImage(imageName: product.yemek_resim_adi!)
        cell.productTitle.text = product.yemek_adi!
        cell.productCount.text = "\(product.yemek_siparis_adet!)"
        cell.productTotalPrice.text = "Total: \(product.yemek_siparis_adet! * (Int(product.yemek_fiyat!)))"

        return cell
    }
}
