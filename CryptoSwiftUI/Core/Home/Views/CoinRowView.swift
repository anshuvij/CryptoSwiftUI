//
//  CoinRowView.swift
//  CryptoSwiftUI
//
//  Created by Anshu Vij on 31/08/24.
//

import SwiftUI

struct CoinRowView: View {
    let coin : CoinModel
    let showHoldingsCol : Bool
    
    var body: some View {
        HStack {
            leftCol
            Spacer()
            
            if showHoldingsCol {
                centerCol
            }
            rightCol
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsCol: true)
                .previewLayout(.sizeThatFits)
            CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsCol: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}


extension CoinRowView {
    
    private var leftCol : some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundStyle(.accent)
        }
    }
    
    private var centerCol : some View {
        VStack(alignment : .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .bold()
        .foregroundStyle(.accent)
    }
    
    private var rightCol : some View {
        
        VStack (alignment: .trailing) {
            
            Text(coin.currentPrice.asNumberString())
                .bold()
                .foregroundStyle(.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0 ) >= 0 ?
                        .green : .red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        
    }
}
