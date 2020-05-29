//
//  XLKLineAccessoryView.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/5/6.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    /// 交易副视图
    class AccessoryView: UIView {
        
        let manager: Manager
        
        /// 绘制网格
        func drawAxisScaleLines() {
            
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
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
//            backgroundColor = manager.config.candleStickBackgroundColor
            backgroundColor = .green
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

// MARK: - 绘制网格
extension XLKLine.AccessoryView: XLKLineDrawVerticalAxisScaleLineProtocol {
    
    /// 绘制垂直网格
    func drawVerticalAxisScaleLines() {
        
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
    
    /// 绘制指标
    func drawIndicator() {
        
        switch manager.config.accessoryIndicatorType {
        case .MACD:
            drawMACDIndicator()
        case .KDJ:
            drawKDJIndicator()
        default:
            break
        }
    }
    
    /// 绘制MACD指标
    func drawMACDIndicator() {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        guard let model = manager.displayAccessoryMACD(bounds: bounds) else {
            return
        }
        for model in model.MACD {
            XLKLine.LineBrush.draw(context: context,
                                   model: model)
        }
        XLKLine.LineBrush.draw(context: context,
                               model: model.DIF)
        XLKLine.LineBrush.draw(context: context,
                               model: model.DEA)
    }
    
    /// 绘制KDJ
    func drawKDJIndicator() {
        
        
    }
    
}