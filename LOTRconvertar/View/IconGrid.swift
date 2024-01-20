//
//  IconGrid.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 5.01.2024.
//

import SwiftUI

struct IconGrid: View {
    
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases){ currency in
                if self.currency == currency {
                    CurrencyIcons(currencyImage: currency.image, currecyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcons(currencyImage: currency.image, currecyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(Currency.goldPiece))
    }
}
