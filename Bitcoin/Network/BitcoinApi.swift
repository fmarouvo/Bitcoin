//
//  BitcoinApi.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import UIKit
import Alamofire

class BitcoinApi {
    
    static let baseUrl = "https://api.blockchain.com/v3/"
    
    static func stats() {
        //return Alamofire.
    }

    func Client() -> DataRequest {
        AF.request("http://careers.picpay.com/tests/mobdev/users",method: .get).responseJSON { (response) in
            if let data = response.data {
                do{
                    let json = try JSONDecoder().decode([Usuario].self, from: data)
                    for usuario in json{
                        self.usuarios.append(usuario)
                    }
                    self.view.reloadData()
                    self.view.stopLoading()
                    
                }catch{
                    print(error)
                }
            }
        }
    }
    
}
