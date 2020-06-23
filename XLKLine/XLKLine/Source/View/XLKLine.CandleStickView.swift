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
            drawHorizontalAxisScaleLines()
            drawCandleStickData()
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
    
    open func drawCandleStickData() {
        
        layer.sublayers = nil
        switch manager.config.timeLineType {
        case .timeline:
            drawTimeline()
        default:
            drawCandleStickBars()
        }
    }
    
    /// 绘制蜡烛图
    open func drawCandleStickBars() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let models = manager.displayCandleStickBarModel(bounds: bounds)
        XLKLine.CandleStickBarBrush.draw(context: context,
                                         models: models)
    }
    
    /// 绘制分时图
    open func drawTimeline() {
        
        guard let model = manager.displayCandleStickTimeLineModel(bounds: bounds) else {
            return
        }
        let realTimeLayer = XLKLine.CandleStickTimelineBrush.draw(bounds: bounds,
                                                                  model: model)
        layer.sublayers = nil
        layer.addSublayer(realTimeLayer)
    }
    
    
    open func drawIndicator() {
        
        guard manager.config.timeLineType != .timeline else {
            return
        }
        
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
extension XLKLine.CandleStickView: XLKLineDrawVerticalAxisScaleLineProtocol, XLKLineDrawHorizontalAxisScaleLineProtocol {
    
    /// 绘制垂直网格
    open func drawVerticalAxisScaleLines() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        drawVerticalAxisScaleLines(context: context,
                                   drawSize: bounds.size,
                                   contentInset: .zero,
                                   lineCount: manager.config.verticalAxisScaleLineCount,
                                   lineColor: manager.config.axisScaleLineColor,
                                   lineWidth: manager.config.axisScaleLineWidth)
    }
    
    /// 绘制水平网格
    open func drawHorizontalAxisScaleLines() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        drawHorizontalAxisScaleLines(context: context,
                                     drawSize: bounds.size,
                                     contentInset: manager.config.candleStickContentInset,
                                     lineCount: manager.config.horizontalCandleStickLineCount,
                                     lineColor: manager.config.axisScaleLineColor,
                                     lineWidth: manager.config.axisScaleLineWidth)
    }
}
