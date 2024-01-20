//
//  Currency.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 3.01.2024.
//

import Foundation
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable{
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: String{
        
        switch self {
            
        case .copperPenny:
            let currencyImage = "copperpenny"
            return currencyImage
        case .silverPenny:
            let currencyImage = "silverpenny"
            return currencyImage
        case .silverPiece:
            let currencyImage = "silverpiece"
            return currencyImage
        case .goldPenny:
            let currencyImage = "goldpenny"
            return currencyImage
        case .goldPiece:
            let currencyImage = "goldpiece"
            return currencyImage
        }
    }
    
    var name: String{
        
        switch self {
        case .copperPenny:
           let currencyName = "Copper Penny"
            return currencyName
        case .silverPenny:
           let currencyName = "Silver Penny"
            return currencyName
        case .silverPiece:
           let currencyName = "Silver Piece"
            return currencyName
        case .goldPenny:
           let currencyName = "Gold Penny"
            return currencyName
        case .goldPiece:
           let currencyName = "Gold Piece"
            return currencyName
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        
        guard let doubleAmount = Double(amountString) else {
            return "" // eğer kullanıcı textfield'a numara yerine harf yazarsa boş string return yapıyor yani textfield boş kalıyor
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
        
    }
}
