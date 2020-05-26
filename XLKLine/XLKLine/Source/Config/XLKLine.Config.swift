//
//  XLKLine.Config.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/4/23.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    public struct Config {
        
        /// 蜡烛图指标类型
        var candleStickIndicatorType: Model.IndicatorType = .MA
        
        /// 背景颜色
        var backgroundColor: UIColor = Color(hex: 0x24262F)
        
        /// 蜡烛图背景颜色
        var candleStickBackgroundColor: UIColor = Color(hex: 0x24262F)
        
        /// 涨的颜色
        var increaseColor: UIColor = Color(hex: 0xFF5353)
        
        /// 跌的颜色
        var decreaseColor: UIColor = Color(hex: 0x00B07C)
        
        /// 量视图高度
        var volumeViewHeightScale: CGFloat = 0.2
        
        /// 副视图高度
        var accessoryViewHeightScale: CGFloat = 0.2
        
        /// 日期视图高度
        var dateViewHeight: CGFloat = 10
        
        /// k线的间隔
        var klineSpace: CGFloat = 1.0
        
        /// k线图主体宽度
        var klineWidth: CGFloat = 8.0
        
        /// 上下影线宽度
        var klineShadowLineWidth: CGFloat = 1.0
        
        /// k线最大宽度
        var klineMaxWidth: CGFloat = 20.0
        
        /// k线最小宽度
        var klineMinWidth: CGFloat = 2.0
        
        /// k线缩放界限
        var klineScale: CGFloat = 0.03
        
        /// k线缩放因子
        var klineScaleFactor: CGFloat = 0.03
        
        /// 蜡烛图指标线宽度
        var candleStickIndicatorLineWidth: CGFloat = 0.8
        
        /// 蜡烛图内边距
        var candleStickContentInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        /// 垂直网格线数量
        var verticalAxisScaleLineCount: Int = 4
        
        /// 网格线宽度
        var axisScaleLineWidth: CGFloat = 0.8
        
        /// 网格线颜色
        var axisScaleLineColor: UIColor = Color(hex: 0x696969)
        
        /// 蜡烛图水平刻度线数量
        var candleStickHorizontalAxisScaleLineCount: Int = 4
        
        /// 副视图水平刻度线数量
        var accessoryHorizontalAxisScaleLineCount: Int = 1
        
        /// 外观布局
        var viewStyles: [XLKLine.ViewStyle] = [.candleStick, .volume, .accessory, .date]
        
        // MARK: 指标参数
        /// 蜡烛图MA参数
        var candleStickMADays: [Int] = [5, 10]
        
        /// 蜡烛图EMA参数
        var candleStickEMADays: [Int] = [5, 10]
        
        /// 蜡烛图BOLL指标N参数
        var candleStickBOLLN: Int = 20
        
        /// 蜡烛图BOLL指标P参数
        var candleStickBOLLP: Int = 2
        
        /// 成交量MA参数
        var volumeMADays: [Int] = [5, 10]
        
        /// 成交量EMA参数
        var volumeEMADays: [Int] = [12, 26]
        
        /// 蜡烛图MA5指标颜色
        var candleStickMA5Color: UIColor = Color(hex: 0x4498EA)
        
        /// 蜡烛图MA10指标颜色
        var candleStickMA10Color: UIColor = Color(hex: 0x00FFFF)
        
        /// 蜡烛图MA30指标颜色
        var candleStickMA30Color: UIColor = Color(hex: 0xFFFF00)
        
        /// 蜡烛图EMA5指标颜色
        var candleStickEMA5Color: UIColor = Color(hex: 0x4498EA)
        
        /// 蜡烛图EMA10指标颜色
        var candleStickEMA10Color: UIColor = Color(hex: 0x00FFFF)
        
        /// 蜡烛图BOLL UP指标颜色
        var candleStickBOLLUp: UIColor = Color(hex: 0x00FFFF)
        
        /// 蜡烛图BOLL MB指标颜色
        var candleStickBOLLMb: UIColor = Color(hex: 0x4498EA)
        
        /// 蜡烛图BOLL DN指标颜色
        var candleStickBOLLDn: UIColor = Color(hex: 0xFFFF00)
        
        /// 交易量MA5指标颜色
        var volumeMA5Color: UIColor = Color(hex: 0x4498EA)
        
        /// 交易量MA10指标颜色
        var volumeMA10Color: UIColor = Color(hex: 0x00FFFF)
        
        /// 交易量EMA12指标颜色
        var volumeEMA12Color: UIColor = Color(hex: 0x4498EA)
        
        /// 交易量EMA26指标颜色
        var volumeEMA26Color: UIColor = Color(hex: 0x00FFFF)
        
        /// MACD指标颜色
        var MACDColor: UIColor = Color(hex: 0x00FFFF)
        
        /// MACD DIF 指标颜色
        var MACDDIFColor: UIColor = Color(hex: 0xC71585)
        
        /// MACD DEA 指标颜色
        var MACDDEAColor: UIColor = Color(hex: 0x1E90FF)
        
        /// KDJ K 指标颜色
        var KDJKColor: UIColor = Color(hex: 0x1E90FF)
        
        /// KDJ D 指标颜色
        var KDJDColor: UIColor = Color(hex: 0xFFA500)
        
        /// KDJ J 指标颜色
        var KDJJColor: UIColor = Color(hex: 0xFFD700)
        
        /// 指标颜色
        /// - Parameters:
        ///   - type: 指标类型
        ///   - param: 指标参数
        /// - Returns: 颜色
        func indicatorColor(type: XLKLine.Model.IndicatorType,
                            param: Int) -> UIColor {
            
            switch type {
            case .MA where param == 5:          //  MA5
                return candleStickMA5Color
            case .MA where param == 10:         //  MA10
                return candleStickMA10Color
            case .MA where param == 30:         //  MA30
                return candleStickMA30Color
            case .EMA where param == 5:         //  EMA5
                return candleStickEMA5Color
            case .EMA where param == 10:        //  EMA10
                return candleStickEMA10Color
            case .BOLL_UP:                      //  BOLL UP
                return candleStickBOLLUp
            case .BOLL_MB:                      //  BOLL MB
                return candleStickBOLLMb
            case .BOLL_DN:                      //  BOLL DN
                return candleStickBOLLDn
            case .MA_VOLUME where param == 5:   //  Volume MA5
                return volumeMA5Color
            case .MA_VOLUME where param == 10:  //  Volume MA10
                return volumeMA10Color
            case .EMA_VOLUME where param == 12: //  Volume EMA12
                return volumeEMA12Color
            case .EMA_VOLUME where param == 26: //  Volume EMA26
                return volumeEMA26Color
            case .MACD:                         //  MACD
                return MACDColor
            case .DIF:                          //  MACD DIF
                return MACDDIFColor
            case .DEA:                          //  MACD DEA
                return MACDDEAColor
            case .KDJ_K:                        //  KDJ K
                return KDJKColor
            case .KDJ_D:                        //  KDJ D
                return KDJDColor
            case .KDJ_J:                        //  KDJ J
                return KDJJColor
            default:
                return Color(hex: 0xFFFFFF)
            }
        }
    }
}
