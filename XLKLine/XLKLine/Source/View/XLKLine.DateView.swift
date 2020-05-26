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
            
        // MARK: - Init
        init() {
            super.init(frame: .zero)
            backgroundColor = .blue
        }
        
        required init?(coder: NSCoder) {
            
            fatalError("init(coder:) has not been implemented")
        }
    }
}

