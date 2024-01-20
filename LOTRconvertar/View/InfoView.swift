//
//  InfoView.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 2.01.2024.
//

import SwiftUI

struct InfoView: View {
    
    @Binding var showInfoScreen: Bool
    
    var body: some View {
        ZStack{
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .kerning(2)
                    .bold()
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding()
                    .font(.title)
                
                ExchangeRates(leftImage: "goldpiece", exchangeText: "1 Gold Piece = 4 Gold penny", rightImage: "goldpenny")
                
                ExchangeRates(leftImage: "goldpenny", exchangeText: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
                
                ExchangeRates(leftImage: "silverpiece", exchangeText: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
                
                ExchangeRates(leftImage: "silverpenny", exchangeText: "1 Silver Penny = 100 Copper Pennies", rightImage: "copperpenny")
                
                Button {
                    showInfoScreen = false
                } label: {
                    Text("Done")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(.brown)
                        .cornerRadius(15)
                }

                
            }
            .foregroundColor(.black)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(showInfoScreen: .constant(false))
    }
}
