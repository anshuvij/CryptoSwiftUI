//
//  HomeView.swift
//  CryptoSwiftUI
//
//  Created by Anshu.Vij on 26/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showProtfolio : Bool = false
    
    var body: some View {
        ZStack {
            //Background layer
            Color.theme.background
                .ignoresSafeArea()
            // content layer
            VStack {
                homeHeader
                colTitles
                
                if !showProtfolio {
                   allCoinsList
                    .transition(.move(edge: .leading))
                } 
                else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
            .toolbar(.hidden)
    }.environmentObject(DeveloperPreview.instance.homeVm)
}

extension HomeView {
    
    private var homeHeader : some View {
        
        HStack {
            CircleButtonView(iconName: showProtfolio ? "plus" : "info")
                .animation(.none,value: showProtfolio)
                .background(
                    CircleButtonAnimationView(animate: $showProtfolio)
                )
            Spacer()
            Text(showProtfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showProtfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showProtfolio.toggle()
                    }
                }
        }.padding(.horizontal)
    }
    
    private var allCoinsList : some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsCol: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList : some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsCol: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var colTitles : some View {
        HStack {
            Text("Coin")
            Spacer()
            
            if showProtfolio {
                Text("Holdings")
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(.secondaryText)
        .padding(.horizontal)
        
    }
}
