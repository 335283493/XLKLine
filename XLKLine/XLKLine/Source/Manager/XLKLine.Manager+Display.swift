//
//  XLKLine.Manager+Display.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/5/19.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

// MARK: - 有关显示方法
public extension XLKLine.Manager {
    
    /// K线最小显示宽度
    /// - Parameter bounds: 显示宽度
    /// - Parameter config: 配置对象
    /// - Returns: 显示宽度
    static func minDisplayWidth(displayWidth: CGFloat,
                                config: XLKLine.Config) -> CGFloat {
        
        let count = CGFloat(config.verticalAxisScaleLineCount)
        return displayWidth * count / CGFloat(count + 1)
    }
    
    /// K线最大显示宽度
    /// - Parameter displayWidth: 显示宽度
    /// - Returns: K线显示宽度
    static func maxDispalyWidth(displayWidth: CGFloat) -> CGFloat {
        return displayWidth
    }
    
    /// K线最小显示数量
    /// - Parameters:
    ///   - displayWidth: 显示宽度
    ///   - config: 配置对象
    /// - Returns: K线最小显示数量
    static func minDisplayCount(displayWidth: CGFloat,
                                config: XLKLine.Config) -> Int {
        
        let width = minDisplayWidth(displayWidth: displayWidth, config: config)
        let unitSpace = config.klineWidth + config.klineSpace
        return Int(width / unitSpace)
    }
    
    /// K线最大显示数量
    /// - Parameters:
    ///   - displayWidth: 显示宽度
    ///   - config: 配置对象
    /// - Returns: K线最大显示数量
    static func maxDisplayCount(displayWidth: CGFloat,
                                config: XLKLine.Config) -> Int {
        
        let width = maxDispalyWidth(displayWidth: displayWidth)
        let unitSpace = config.klineWidth + config.klineSpace
        return Int(width / unitSpace)
    }
    
    /// 计算默认显示位置
    /// - Parameters:
    ///   - displayWidth: 显示宽度
    ///   - modelsCount: 模型数量
    ///   - config: 配置对象
    /// - Returns: 当前位置
    static func defaultLocation(displayWidth: CGFloat,
                                modelsCount: Int,
                                currentLocation: Int,
                                config: XLKLine.Config) -> Int {
        
        if modelsCount == 0 { //  数据为空
            return 0
        }
        
        let minCount = minDisplayCount(displayWidth: displayWidth,
                                       config: config)
        if modelsCount < minCount { //  数据数量 小于 最小显示数量
            
            return 0
        }
        return modelsCount - minCount - 1
    }
    
    /// 显示K线数量
    /// - Parameters:
    ///   - displayWidth: 显示宽度
    ///   - modelsCount: 数据数量
    ///   - currentLocation: 当前位置
    ///   - config: 配置对象
    /// - Returns: 显示K线数量
    static func displayCount(displayWidth: CGFloat,
                             modelsCount: Int,
                             currentLocation: Int,
                             config: XLKLine.Config) -> Int {
        
        if modelsCount == 0 { //  数据为空
            return 0
        }
        
        let minCount = minDisplayCount(displayWidth: displayWidth,
                                              config: config)
        if modelsCount < minCount { //  数据数量 小于 最小显示数量
            
            return modelsCount
        }
 
        return modelsCount - currentLocation
    }
    
    /// 显示范围
    /// - Parameters:
    ///   - displayWidth: 显示宽度
    ///   - modelsCount: 模型数量
    ///   - currentLocation: 当前位置
    ///   - config: 配置对象
    /// - Returns: 显示范围
    static func displayRange(displayWidth: CGFloat,
                             modelsCount: Int,
                             currentLocation: Int,
                             config: XLKLine.Config) -> NSRange? {
        
        if modelsCount == 0 {
            return nil
        }
        
        let displayCount = XLKLine.Manager.displayCount(displayWidth: displayWidth,
                                                        modelsCount: modelsCount,
                                                        currentLocation: currentLocation,
                                                        config: config)
        let location = currentLocation
        let length = displayCount
        return NSRange(location: location,
                       length: length)
    }
    
    /// 截取显示的模型
    /// - Parameters:
    ///   - models: 模型
    ///   - displayWidth: 显示宽度
    ///   - currentLocation: 当前位置
    ///   - config: 显示模型
    static func displayModels(models:[XLKLine.Model],
                              displayWidth: CGFloat,
                              currentLocation: Int,
                              config: XLKLine.Config) -> [XLKLine.Model] {
        
        guard let displayRange = displayRange(displayWidth: displayWidth,
                                              modelsCount: models.count,
                                              currentLocation: currentLocation,
                                              config: config) else {
                                                
                                                return []
        }
        guard displayRange.location + displayRange.length <= models.count &&
            displayRange.location >= 0 else {
                
                return []
        }
        guard let range = Range(displayRange) else {
            return []
        }
        return Array(models[range])
    }
}
