//
//  ProductViewModel.swift
//  ProductDemoTask
//
//  Created by CM on 15/07/23.
//

import Foundation
protocol ProdctViewModelProtocol{
    func FetchData(productList:Product)
}
class ProductViewModel{
    var delegate:ProdctViewModelProtocol?
    func GetJsonData(){
        let dt = Utility.readLocalJSONFile(forName: "dwsample1-json")
        if let data = dt {
        if let productList = parse(jsonData: data) {
          print("users list: \(productList.products)")
            delegate?.FetchData(productList: productList)
           
         }
      }
    }
    
    
    func parse(jsonData: Data) -> Product? {
        do {
            let decodedData = try JSONDecoder().decode(Product.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    func CheckProductAdd(pr:Product)->Bool{
        for i in pr.products{
            if i.isadd ?? false{
               return true
            }
        }
        return false
    }
}
