//
//  XLKLine.Manager.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/5/6.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    open class Manager {
        
        /// 配置对象
        open var config: Config = Config()
        
        /// 获取数据
        open var models: [Model] = [] {
            
            didSet {
                
                generateIndicatorData(models: models,
                                      config: config)
                reloadCurrentLocation()
            }
        }
        
        /// 获取显示范围
        open var displayWidth: ((Manager)->(CGFloat))?
        
        /// 显示宽度
        open func getDisplayWidth() -> CGFloat {
            
            return displayWidth?(self) ?? 0
        }
        
        /// 当前左侧位置
        open var currentLocation: Int = 0
        
        // MARK: - Methods
        /// 显示模型
        /// - Parameter displayWidth: 显示宽度
        /// - Returns: 显示模型
        public func displayBarModels(displayWidth: CGFloat? = nil) -> [XLKLine.Model] {
            
            let width = displayWidth ?? getDisplayWidth()
            return Manager.displayBarModels(models: models,
                                            displayWidth: width,
                                            currentLocation: currentLocation,
                                            config: config)
        }
        
        /// 显示指标模型
        /// - Parameter displayWidth: 显示宽度
        /// - Returns: 显示模型
        public func displayIndicatorModels(displayWidth: CGFloat? = nil) -> XLKLine.Manager.DisplayModel {
            let width = displayWidth ?? getDisplayWidth()
            return Manager.displayIndicatorModels(models: models,
                                                  displayWidth: width,
                                                  currentLocation: currentLocation,
                                                  config: config)
        }
        
        /// 蜡烛图绘制模型
        /// - Parameter bounds: 绘制范围
        /// - Returns: 绘制模型
        open func displayCandleStickBarModel(bounds: CGRect) -> [XLKLineCandleStickBarBrushProtocol] {
            
            let type = config.candleStickIndicatorType
            let models = displayBarModels()
            guard let limitValue = Manager.candleStickLimitValue(models: models,
                                                                 indicatorType: type) else {
                                                                    return []
            }
            let contentInset = config.candleStickContentInset
            return XLKLine.CandleStickBarBrushModel.generate(models: models,
                                                             bounds: bounds,
                                                             contentInset: contentInset,
                                                             limitValue: limitValue,
                                                             config: config)
        }
        
        /// 蜡烛图绘制指标模型
        /// - Parameter bounds: 绘制范围
        /// - Returns: 绘制指标模型
        open func displayCandleStickIndicatorModel(bounds: CGRect) -> [XLKLineLineBrushProtocol] {
            
            let type = config.candleStickIndicatorType
            let display = displayIndicatorModels()
            guard let limitValue = Manager.candleStickLimitValue(models: display.models,
                                                                 indicatorType: type) else {
                                                                    return []
            }
            switch type {
            case .MA:
                return XLKLine.CandleStickMA.generate(models: display.models,
                                                      leadingPreloadModels: display.leadingPreloadModels,
                                                      trailingPreloadModels: display.trailingPreloadModels,
                                                      bounds: bounds,
                                                      limitValue: limitValue,
                                                      config: config)
            case .BOLL:
                return XLKLine.CandleStickBOLL.generate(models: display.models,
                                                        leadingPreloadModels: display.leadingPreloadModels,
                                                        trailingPreloadModels: display.trailingPreloadModels,
                                                        bounds: bounds,
                                                        limitValue: limitValue,
                                                        config: config)
            default:
                return []
            }
        }
        
        open func displayVolumeBarModel(bounds: CGRect) -> [XLKLineLineBrushProtocol] {
            
            let type = config.candleStickIndicatorType
            let models = displayBarModels()
            guard let limitValue = Manager.volumeLimitValue(models: models,
                                                            indicatorType: type) else {
                                                                return []
            }
            return XLKLine.Volume.generate(models: models,
                                           bounds: bounds,
                                           limitValue: limitValue,
                                           config: config)
        }
        
        open func displayVolumeIndicatorModel(bounds: CGRect) -> [XLKLineLineBrushProtocol] {
            
            let type = config.candleStickIndicatorType
            let display = displayIndicatorModels()
            guard let limitValue = Manager.volumeLimitValue(models: display.models,
                                                            indicatorType: type) else {
                                                                return []
            }
            return XLKLine.VolumeMA.generate(models: display.models,
                                             leadingPreloadModels: display.leadingPreloadModels,
                                             trailingPreloadModels: display.trailingPreloadModels,
                                             bounds: bounds,
                                             limitValue: limitValue,
                                             config: config)
        }
        
        open func displayAccessoryMACD(bounds: CGRect) -> XLKLine.AccessoryMACD.Response? {
            
            let type = config.accessoryIndicatorType
            let display = displayIndicatorModels()
            guard let limitValue = Manager.accessoryLimitValue(models: display.models,
                                                               indicatorType: type) else {
                                                                return nil
            }
            return XLKLine.AccessoryMACD.generate(models: display.models,
                                                  leadingPreloadModels: display.leadingPreloadModels,
                                                  trailingPreloadModels: display.trailingPreloadModels,
                                                  bounds: bounds,
                                                  limitValue: limitValue,
                                                  config: config)
        }
        
        open func displayAccessoryKDJ(bounds: CGRect) -> XLKLine.AccessoryKDJ.Response? {
            
            let type = config.accessoryIndicatorType
            let display = displayIndicatorModels()
            guard let limitValue = Manager.accessoryLimitValue(models: display.models,
                                                               indicatorType: type) else {
                                                                return nil
            }
            
            return XLKLine.AccessoryKDJ.generate(models: display.models,
                                                 leadingPreloadModels: display.leadingPreloadModels,
                                                 trailingPreloadModels: display.trailingPreloadModels,
                                                 bounds: bounds,
                                                 limitValue: limitValue,
                                                 config: config)
        }
        
        open func displayAccessoryRSI(bounds: CGRect) -> [XLKLine.AccessoryRSI] {
            
            let type = config.accessoryIndicatorType
            let display = displayIndicatorModels()
            guard let limitValue = Manager.accessoryLimitValue(models: display.models,
                                                               indicatorType: type) else {
                                                                return []
            }
            return XLKLine.AccessoryRSI.generate(models: display.models,
                                                 leadingPreloadModels: display.leadingPreloadModels,
                                                 trailingPreloadModels: display.trailingPreloadModels,
                                                 bounds: bounds,
                                                 limitValue: limitValue,
                                                 config: config)
        }
        
        open func displayAccessoryWR(bounds: CGRect) -> [XLKLine.AccessoryWR] {
            
            let type = config.accessoryIndicatorType
            let display = displayIndicatorModels()
            guard let limitValue = Manager.accessoryLimitValue(models: display.models,
                                                               indicatorType: type) else {
                                                                return []
            }
            return XLKLine.AccessoryWR.generate(models: display.models,
                                                leadingPreloadModels: display.leadingPreloadModels,
                                                trailingPreloadModels: display.trailingPreloadModels,
                                                bounds: bounds,
                                                limitValue: limitValue,
                                                config: config)
        }
        
        /// 重置当前位置
        open func reloadCurrentLocation() {
            
            if models.isEmpty {
                
                currentLocation = 0
                return
            }
            currentLocation = Manager.defaultLocation(displayWidth: getDisplayWidth(),
                                                      modelsCount: models.count,
                                                      currentLocation: currentLocation,
                                                      config: config)
        }
        
        /// 更新当前位置
        open func updateCurrentLocation() {
            
            if models.isEmpty {
                
                currentLocation = 0
                return
            }
            let defualtLocation = Manager.defaultLocation(displayWidth: getDisplayWidth(),
                                                          modelsCount: models.count,
                                                          currentLocation: currentLocation,
                                                          config: config)
            currentLocation = min(defualtLocation, max(currentLocation, 0))
        }
        
        // MARK: - Init
        public init() {
            
        }
    }
}
