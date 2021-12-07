//
//  CryptoViewModel.swift
//  CryptoCrazySUI
//
//  Created by Tolga on 5.10.2021.
//

import Foundation
import Combine

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    func downloadCryptos(url : URL) {
        
        webservice.downloadCurrencies(url: url) { result in
            
            switch result {
                
                case .failure(let error):
                    print(error)
                
                case .success(let cryptos):
                    if let cryptos = cryptos {
                        DispatchQueue.main.async {
                            self.cryptoList = cryptos.map(CryptoViewModel.init)
                        }
                    
                }
                
            }
            
        }
        
    }
    
}



struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
}
