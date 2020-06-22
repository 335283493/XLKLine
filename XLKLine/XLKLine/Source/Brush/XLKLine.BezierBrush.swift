//
//  XLKLine.BezierBrush.swift
//  XLKLine
//
//  Created by xx11dragon on 2020/6/18.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit

extension XLKLine {
    
    struct BezierBrush {
        
        public static func bezierPath(models: [CGPoint?]) -> UIBezierPath {
            
            let lineSmoothness: CGFloat = 0.16
            let path = UIBezierPath()
            
            var prePreviousPoint: CGPoint?
            var previousPoint: CGPoint?
            var currentPoint: CGPoint?
            var nextPoint: CGPoint?
            
            for (index, model) in models.enumerated() {
                
                guard let model = model else {
                    continue
                }
                if currentPoint == nil {
                    currentPoint = model
                }
                if previousPoint == nil {
                    previousPoint = index > 0 ? models[index - 1] : model
                }
                if prePreviousPoint == nil {
                    prePreviousPoint = index > 1 ? models[index - 2] : previousPoint
                }
                nextPoint = index < models.count - 1 ? models[index + 1] : model
   
                if index == 0 {
                    path.move(to: model)
                } else {
                    guard let prePreviousPoint = prePreviousPoint,
                        let previousPoint = previousPoint,
                        let currentPoint = currentPoint,
                        let nextPoint = nextPoint else {

                        continue
                    }
                    let firstDiff = CGPoint(x: currentPoint.x - prePreviousPoint.x,
                                            y: currentPoint.y - prePreviousPoint.y)
                    let secondDiff = CGPoint(x: nextPoint.x - previousPoint.x,
                                             y: nextPoint.y - previousPoint.y)
                    
                    let fistControl = CGPoint(x: previousPoint.x + lineSmoothness * firstDiff.x,
                                              y: previousPoint.y + lineSmoothness * firstDiff.y)
                    let secondControl = CGPoint(x: currentPoint.x - lineSmoothness * secondDiff.x,
                                                y: currentPoint.y - lineSmoothness * secondDiff.y)
                    path.addCurve(to: currentPoint,
                                      controlPoint1: fistControl,
                                      controlPoint2: secondControl)
                }
                
                prePreviousPoint = previousPoint
                previousPoint = currentPoint
                currentPoint = nextPoint
            }
            return path
        }
    }
}
