//
//  XLKLine.XLKLine.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/5/6.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    /// 交易量视图
    class VolumeView: UIView {
        
        let manager: Manager
        
        /// 绘制网格
        func drawAxisScaleLines() {
            
            drawVerticalAxisScaleLines()
        }
        
        // MARK: - Override
        public override func draw(_ rect: CGRect) {
            super.draw(rect)

            drawAxisScaleLines()
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
//            backgroundColor = manager.config.candleStickBackgroundColor
            backgroundColor = .yellow
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
extension XLKLine.VolumeView: XLKLineDrawVerticalAxisScaleLineProtocol {
    
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
}
