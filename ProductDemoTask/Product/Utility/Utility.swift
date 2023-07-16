//
//  Utility.swift
//  ProductDemoTask
//
//  Created by CM on 15/07/23.
//

import Foundation

class Utility{
//    func readJSONFile(forName name: String) {
//       do {
//          if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
//          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//             if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
//                print("JSON: \(json)")
//             } else {
//                print("Given JSON is not a valid dictionary object.")
//             }
//          }else {
//              print("Given JSON is not a valid dictionary object.")
//           }
//       } catch {
//          print(error)
//       }
//    }
   static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    

}

