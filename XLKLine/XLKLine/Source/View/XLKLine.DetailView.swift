//
//  XLKLine.BarDetailView.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/6/24.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    class DetailView: UIView {
        
        public let manager: Manager
        
        open var longPressPosition: CGPoint?
        
        private lazy var selectLayer: CAGradientLayer = {
            
            var gradientLayer = CAGradientLayer()
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            gradientLayer.colors = [
                manager.config.selectViewBackgroundColor.withAlphaComponent(0.1).cgColor,
                manager.config.selectViewBackgroundColor.cgColor,
                manager.config.selectViewBackgroundColor.withAlphaComponent(0.1).cgColor
            ]
//            gradientLayer.locations = [0,0.25,1]
            layer.addSublayer(gradientLayer)
            return gradientLayer
        }()
        
        open func reloadData() {

            isHidden = longPressPosition == nil
            reloadSelectLayer()
        }
        
        open func reloadSelectLayer() {
            
            guard let longPressPosition = longPressPosition,
                let x = manager.barFrameX(locationX: longPressPosition.x) else {

                return
            }
            let y: CGFloat = 0
            let width = manager.config.klineWidth
            let height = bounds.size.height
            
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            selectLayer.frame = CGRect(x: x,
                                       y: y,
                                       width: width,
                                       height: height)
            CATransaction.commit()
            print(selectLayer.frame)
        }
        
        // MARK: - Init
        public init(manager: XLKLine.Manager) {
            self.manager = manager
            super.init(frame: .zero)

        }
        
        required public init?(coder: NSCoder) {
            
            fatalError("init(coder:) has not been implemented")
        }
    }
}
