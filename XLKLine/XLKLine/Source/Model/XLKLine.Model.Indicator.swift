//
//  XLKLine.Model.Indicator.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/4/23.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import Foundation

public extension XLKLine.Model {
    
    struct Indicator {
        // MARK: 指标
        // 之前数据所有开盘价之和
        var sumOpen: Double?
        
        // 之前数据所有收盘价之和
        var sumClose: Double?
        
        // 之前数据所有最高价之和
        var sumHigh: Double?
        
        // 之前数据所有最低价之和
        var sumLow: Double?
        
        // 之前数据所有成交量之和
        var sumVolume: Double?
        
        // MARK: MA - MA(N) = (C1+C2+……CN) / N, C:收盘价
        var MA: [String: Double]?
        var MA_VOLUME: [String: Double]?
        
        // MARK: EMA - EMA(N) = 2 / (N+1) * (C-昨日EMA) + 昨日EMA, C:收盘价
        var EMA: [String: Double]?
        var EMA_VOLUME: [String: Double]?
        
        // MARK: MACD
        //  EMA(S)
        var EMA_S: Double?
        //  EMA(L)
        var EMA_L: Double?
        // DIF = EMA(S) - EMA(L)
        var DIF: Double?
        // DEA = （前一日DEA X 8/10 + 今日DIF X 2/10）
        var DEA: Double?
        // MACD(12,MA9) = (DIF - DEA) * 2
        var MACD: Double?
        
        // MARK: KDJ(9,3,3) 代表指标分析周期为9天，K值D值为3天
        // 九个交易日内最低价
        var minPriceOfNineClock: Double?
        // 九个交易日最高价
        var maxPriceOfNineClock: Double?
        // RSV(9) =（今日收盘价－9日内最低价）/（9日内最高价－9日内最低价）* 100
        var RSV9: Double?
        // K(3) =（当日RSV值+2*前一日K值）/ 3
        var KDJ_K: Double?
        // D(3) =（当日K值 + 2*前一日D值）/ 3
        var KDJ_D: Double?
        // J = 3K － 2D
        var KDJ_J: Double?
        
        // MARK: BOLL
        // 中轨线
        var BOLL_MB: Double?
        // 上轨线
        var BOLL_UP: Double?
        // 下轨线
        var BOLL_DN: Double?
    }
}

