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
        
        self.navigationItem.hidesBackButton = true
        let customBackButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(goToMain))
        self.navigationItem.leftBarButtonItem = customBackButton
    }
    
    // custom back to root vc
    @objc func goToMain() {
        for controller in self.navigationController!.viewControllers {
              if let target = controller as? HomeController {
                  self.navigationController!.popToViewController(target, animated: true)
              }
        }
      }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getAllCart()
    }
}

extension CartController: PresenterToViewCartProtocol {
    func dataToView(cartList: Array<Sepet>) {
        self.cartList = cartList
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
        }
    }
}

extension CartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = cartList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        cell.selectionStyle = .none
        
        cell.productImage.setNetworkImage(imageName: product.yemek_resim_adi!)
        cell.productTitle.text = product.yemek_adi!
        cell.productCount.text = "Quantity:\(product.yemek_siparis_adet!)"
        cell.productTotalPrice.text = "Total: \(Int(product.yemek_siparis_adet!)! * Int(product.yemek_fiyat!)!)₺"

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = cartList[indexPath.row]
        
        let alert = UIContextualAction(style: .destructive, title: "Remove Product") {(action, view, bool) in
            self.cartPresenterObject?.delete(id: product.sepet_yemek_id!)
        }
        
        return UISwipeActionsConfiguration(actions: [alert])
    }
}
