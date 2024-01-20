//
//  CurrencyIcons.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 2.01.2024.
//

import SwiftUI

struct CurrencyIcons: View {
    
    var currencyImage: String
    var currecyName: String
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            Image(currencyImage)
                .resizable()
                .scaledToFit()
                .frame(height: 110)
            
            Spacer()
            
            Text(currecyName)
                .padding(3)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.7))
        }
        .padding(3)
        .frame(width: 120, height: 120)
        .background(.brown)
        .cornerRadius(25)
        
    }
}

struct CurrencyIcons_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcons(currencyImage: "goldpenny", currecyName: "Copper Penny")
    }
}
