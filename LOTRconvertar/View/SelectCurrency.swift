//
//  SelectCurrency.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 2.01.2024.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Binding var showSelectCurrency: Bool
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack{
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                
                //Text
                Text("Select the curreny you are starting with:")
                    .font(.headline)
                
                //Currency icons
                
                IconGrid(currency: $topCurrency)
                
                //Text
                
                Text("Select the currency you would like to convert to")
                    .font(.headline)
                
                //Currency icons
                
                IconGrid(currency: $bottomCurrency)
                
                //Done Button
                
                Button {
                    showSelectCurrency = false
                } label: {
                    Text("Done")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(.brown)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(showSelectCurrency: .constant(false), topCurrency: .constant(Currency.silverPiece), bottomCurrency: .constant(Currency.goldPiece))
    }
}
