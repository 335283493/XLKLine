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
        public func displayModels(displayWidth: CGFloat? = nil) -> [XLKLine.Model] {
            
            let width = displayWidth ?? getDisplayWidth()
            return Manager.displayModels(models: models,
                                         displayWidth: width,
                                         currentLocation: currentLocation,
                                         config: config)
        }
        
        /// 蜡烛图绘制模型
        /// - Parameter bounds: 绘制范围
        /// - Returns: 蜡烛图绘制模型
        open func displayCandleStickBarModel(bounds: CGRect) -> [CandleStickBarBrushModel] {
            
            let type = config.candleStickIndicatorType
            let models = displayModels()
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
        
        open func displayCandleStickIndicatorModel(bounds: CGRect) -> [XLKLineLineBrushProtocol] {
            
            let type = config.candleStickIndicatorType
            let models = displayModels()
            guard let limitValue = Manager.candleStickLimitValue(models: models,
                                                                 indicatorType: type) else {
                                                                    return []
            }
            switch type {
            case .MA:
                return XLKLine.CandleStickMA.generate(models: models,
                                                      bounds: bounds,
                                                      limitValue: limitValue,
                                                      config: config)
            default:
                return []
            }
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

