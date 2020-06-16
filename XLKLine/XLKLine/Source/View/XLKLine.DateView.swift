//
//  XLKLineDateView.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/5/6.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    /// 日期视图
    class DateView: UIView {
        
        let manager: Manager
        
        open var dateLabels: [UILabel] = []
        
        private func initDateLabels() {
            
            dateLabels.forEach { (label) in
                label.removeFromSuperview()
            }
            dateLabels.removeAll()
            for _ in 0 ..< manager.config.verticalAxisScaleLineCount + 2 {
                let label = UILabel()
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 10)
                label.text = "2020-6-16"
                addSubview(label)
                dateLabels.append(label)
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            let width = bounds.width / CGFloat(manager.config.verticalAxisScaleLineCount + 1)
            let y: CGFloat = 0
            let height: CGFloat = bounds.height
            for (index, label) in dateLabels.enumerated() {
                let x = CGFloat(index) * width - width / 2
                label.frame = CGRect(x: x,
                                     y: y,
                                     width: width,
                                     height: height)
            }
        }
            
        // MARK: - Init
        public init(manager: XLKLine.Manager = Manager()) {
            self.manager = manager
            super.init(frame: .zero)
            initDateLabels()
        }
        
        required public init?(coder: NSCoder) {
            
            fatalError("init(coder:) has not been implemented")
        }
    }
}
