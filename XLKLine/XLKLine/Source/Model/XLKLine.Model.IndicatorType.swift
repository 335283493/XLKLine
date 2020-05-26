//
//  XLKLine.Model.Indicator.Type.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/4/23.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import Foundation

extension XLKLine.Model {
    
    public enum IndicatorType: String {
        
        case NONE       = ""
        case MA
        case MA_VOLUME
        case EMA
        case EMA_VOLUME
        case DIF
        case DEA
        case MACD
        case KDJ
        case KDJ_K
        case KDJ_D
        case KDJ_J
        case BOLL
        case BOLL_MB
        case BOLL_UP
        case BOLL_DN
        case RSI
        case VOL
        case DMI
    }
}
