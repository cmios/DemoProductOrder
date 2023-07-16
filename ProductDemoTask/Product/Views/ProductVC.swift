//
//  ProductVC.swift
//  ProductDemoTask
//
//  Created by CM on 14/07/23.
//

import UIKit

class ProductVC: UIViewController, ProdctViewModelProtocol {
    
    
    
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var tblProduct: UITableView!
    
    var productList :Product?
    var vmModel = ProductViewModel()
    var totAmt:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetupTable()
        vmModel.delegate = self
        vmModel.GetJsonData()
        
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
   
    
    func SetupTable(){
        tblProduct.register(UINib(nibName: "ProductTblCell", bundle: nil), forCellReuseIdentifier: "ProductTblCell")
        tblProduct.dataSource = self
        tblProduct.delegate = self
    }
    
    func FetchData(productList: Product) {
        self.productList = productList
        self.tblProduct.reloadData()
    }
    
    
    @IBAction func btnBuyAction(_ sender: Any) {
      let valid =  vmModel.CheckProductAdd(pr: productList!)
        if valid{
            for i in 0..<(productList?.products.count ?? 0) {
                productList?.products[i].isadd = false
            }
            tblProduct.reloadData()
            btnBuy.setTitle("Buy", for: .normal)
            totAmt = 0
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as! SuccessVC
            self.present(vc, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Alert", message: "Add product", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
        }
        
    }
}

