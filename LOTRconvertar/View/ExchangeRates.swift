//
//  ExchangeRates.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 2.01.2024.
//

import SwiftUI

struct ExchangeRates: View {
    
    var leftImage: String
    var exchangeText: String
    var rightImage: String
    
    var body: some View {
        
        HStack{
            
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(exchangeText)
                .font(.headline)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
        
    }
}

struct ExchangeRates_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRates(leftImage: "silverpenny", exchangeText: "gold", rightImage: "goldpenny")
    }
}
