//
//  ContentView.swift
//  LOTRconvertar
//
//  Created by Alperen Sarışan on 2.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var showInfoScreen = false
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Curreny Exchange")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .kerning(2)
                
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency = true
                        }.sheet(isPresented: $showSelectCurrency){
                            SelectCurrency(showSelectCurrency: $showSelectCurrency, topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                        }
                        .onChange(of: leftCurrency) { newValue in
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        }
                        
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) { newValue in
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            .keyboardType(.decimalPad)
                    }
                    
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    VStack{
                        HStack{
                            
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency = true
                        }.sheet(isPresented: $showSelectCurrency){
                            SelectCurrency(showSelectCurrency: $showSelectCurrency, topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                        }
                        .onChange(of: rightCurrency) { newValue in
                            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) { newValue in
                                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                            }
                            .keyboardType(.decimalPad)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(Capsule())
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showInfoScreen = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }

                }
                .padding()
                .sheet(isPresented: $showInfoScreen) {
                    InfoView(showInfoScreen: $showInfoScreen)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
