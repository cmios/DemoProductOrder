//
//  SuccessVC.swift
//  ProductDemoTask
//
//  Created by CM on 16/07/23.
//

import UIKit

class SuccessVC: UIViewController {

    @IBOutlet weak var btnOk: UIView!
    @IBOutlet weak var lblSuccessMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnOkAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   

}
