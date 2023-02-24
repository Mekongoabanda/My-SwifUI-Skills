//
//  APIResponse.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 13/02/2023.
//

//API coins ranking : https://developers.coinranking.com/api/documentation/coins

import Foundation

struct APIResponse : Decodable {
    
    var status : String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Decodable {
    let stats: Stats?
    let coins: [Coin]?
}

// MARK: - Coin
struct Coin: Decodable {
    let uuid, symbol, name, color: String?
    let iconUrl: String?
    let marketCap, price, btcPrice: String?
    let listedAt: Int?
    let change: String?
    let rank: Int?
    let sparkline: [String]?
    let coinrankingUrl: String?
    let the24HVolume: String?

}

// MARK: - Stats
struct Stats: Decodable {
    let total, totalCoins, totalMarkets, totalExchanges: Int?
    let totalMarketCap, total24HVolume: String?

}
