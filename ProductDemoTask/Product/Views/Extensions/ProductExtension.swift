//
//  ProductExtension.swift
//  ProductDemoTask
//
//  Created by CM on 17/07/23.
//

import Foundation
import UIKit

extension ProductVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.products.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTblCell", for: indexPath) as! ProductTblCell
        let pDetail = productList?.products[indexPath.row]
        cell.lblProductName.text = pDetail?.title
        cell.imgProduct.image = UIImage(named: pDetail?.images ?? "")
        cell.lblPrice.text = "₹\(pDetail?.price ?? 0)"
        cell.btnAdd.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(BtnAddAction(sen:)), for: .touchUpInside)
        cell.btnAdd.isSelected = pDetail?.isadd ?? false

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    @objc func BtnAddAction(sen:UIButton){
        let cuVal = productList?.products[sen.tag].isadd ?? false
        productList?.products[sen.tag].isadd = !cuVal
        tblProduct.reloadRows(at: [IndexPath(row: sen.tag, section: 0)], with: .none)
        let pr =  productList?.products[sen.tag].price ?? 0
        if cuVal == true{
            
            totAmt = totAmt-pr
        }else{
            totAmt = totAmt+pr
        }
        if totAmt>0{
            btnBuy.setTitle("Buy ₹(\(totAmt))", for: .normal)
        }else{
            btnBuy.setTitle("Buy", for: .normal)
        }
        
    }
}
