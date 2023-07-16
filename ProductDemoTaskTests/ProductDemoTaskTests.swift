//
//  ProductDemoTaskTests.swift
//  ProductDemoTaskTests
//
//  Created by CM on 14/07/23.
//

import XCTest
@testable import ProductDemoTask

class ProductDemoTaskTests: XCTestCase ,ProdctViewModelProtocol{
    var product:Product?
    let vm  = ProductViewModel()
    func FetchData(productList: Product) {
        self.product = productList
    }
    

    override func setUpWithError() throws {
        vm.delegate = self
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testFetchData(){
        
      vm.GetJsonData()
       
      XCTAssertEqual(product?.products.count, 5, "Number of product in json is 5")
        
    }
    
    func testNoProductAdd(){
        vm.GetJsonData()
       let res =  vm.CheckProductAdd(pr: product!)
        XCTAssertFalse(res)
    }
    func testAddProduct(){
        vm.GetJsonData()
        product?.products[0].isadd = true
       let res =  vm.CheckProductAdd(pr: product!)
       XCTAssertTrue(res)
    }

}
