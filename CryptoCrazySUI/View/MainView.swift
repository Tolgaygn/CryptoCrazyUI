//
//  ContentView.swift
//  CryptoCrazySUI
//
//  Created by Tolga on 5.10.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListModel : CryptoListViewModel
    
    init() {
        self.cryptoListModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            
            List(cryptoListModel.cryptoList,id:\.id) { cryptos in
                
                VStack{
                    
                    Text(cryptos.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(cryptos.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                
            }.navigationTitle("Crypto Crazy")
            
        }.onAppear {
            
            cryptoListModel.downloadCryptos(url: URL(string: "https://api.nomics.com/v1/prices?key=f73281becfc61a94e9b76313cf1241b8e736c213")!)
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
