//
//  XLKLine.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/5/6.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    /// 主视图
    class CandleStickView: UIView {
        
        let manager: Manager
        
        /// 绘制网格
        open func drawAxisScaleLines() {
            
            drawVerticalAxisScaleLines()
        }
        
        /// 重置
        open func reloadData() {
            
            setNeedsDisplay()
        }
        
        // MARK: - Override
        public override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            drawAxisScaleLines()
            drawCandleStickBars()
            drawIndicator()
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()

            backgroundColor = manager.config.candleStickBackgroundColor
        }
        
        // MARK: - Init
        public init(manager: XLKLine.Manager = Manager()) {
            self.manager = manager
            super.init(frame: .zero)
        }
        
        required public init?(coder: NSCoder) {
            
            fatalError("init(coder:) has not been implemented")
        }
    }
}

// MARK: - 绘制数据
extension XLKLine.CandleStickView {
    
    /// 绘制蜡烛图
    open func drawCandleStickBars() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let models = manager.displayCandleStickBarModel(bounds: bounds)
        XLKLine.CandleStickBarBrush.draw(context: context,
                                         bounds: bounds,
                                         models: models)
    }
    
    
    open func drawIndicator() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let indicatorModels = manager.displayCandleStickIndicatorModel(bounds: bounds)
        for model in indicatorModels {
            XLKLine.LineBrush.draw(context: context,
                                   model: model)
        }
    }
}

// MARK: - 绘制网格
extension XLKLine.CandleStickView: XLKLineDrawVerticalAxisScaleLineProtocol {
    
    /// 绘制垂直网格
    open func drawVerticalAxisScaleLines() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        drawVerticalAxisScaleLines(context: context,
                                   drawSize: bounds.size,
                                   contentInset: manager.config.candleStickContentInset,
                                   lineCount: manager.config.verticalAxisScaleLineCount,
                                   lineColor: manager.config.axisScaleLineColor,
                                   lineWidth: manager.config.axisScaleLineWidth)
    }
}