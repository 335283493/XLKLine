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
        
        public static func draw(bounds: CGRect,
                                models: [XLKLineCandleStickBarBrushProtocol]) -> CAShapeLayer {

            let positions = models.map {
                $0.body.positions.last!!
            }
            let test = [
                CGPoint(x: 0.0, y: 791.9015),
                CGPoint(x: 26.25, y: 933.5422),
                CGPoint(x: 52.5, y: 959.717),
                CGPoint(x: 78.75, y: 745.4135),
                CGPoint(x: 105.0, y: 565.12225),
                CGPoint(x: 131.25, y: 610.121),
                CGPoint(x: 157.5, y: 544.7476),
                CGPoint(x: 183.75, y: 573.65656),
                CGPoint(x: 210.0, y: 541.2566),
                CGPoint(x: 236.25, y: 580.33716),
                CGPoint(x: 262.5, y: 534.50903),
                CGPoint(x: 288.75, y: 394.45065),
                CGPoint(x: 315.0, y: 456.68094),
                CGPoint(x: 341.25, y: 488.3485),
                CGPoint(x: 367.5, y: 565.67017),
                CGPoint(x: 393.75, y: 462.33765),
                CGPoint(x: 420.0, y: 453.12292),
                CGPoint(x: 446.25, y: 432.5483),
                CGPoint(x: 472.5, y: 552.0481),
                CGPoint(x: 498.75, y: 606.4404),
                CGPoint(x: 525.0, y: 596.0684),
                CGPoint(x: 551.25, y: 605.92303),
                CGPoint(x: 577.5, y: 683.9361)
            ]
            let linePath = XLKLine.BezierBrush.bezierPath(models: positions)
            linePath.lineWidth = 1

            
            let lineLayer = CAShapeLayer()
            lineLayer.path = linePath.cgPath
            lineLayer.lineWidth = 1
            lineLayer.strokeColor = UIColor.white.cgColor
            lineLayer.fillColor = UIColor.clear.cgColor
            
            
            let path2 = UIBezierPath()
            for p in positions {
                if path2.isEmpty {
                    path2.move(to: p)
                }else {
                    path2.addLine(to: p)
                }
            }
            
            let lineLayer2 = CAShapeLayer()
            lineLayer2.path = path2.cgPath
            lineLayer2.lineWidth = 1
            lineLayer2.strokeColor = UIColor.red.cgColor
            lineLayer2.fillColor = UIColor.clear.cgColor
            
//            lineLayer.addSublayer(lineLayer2)
            
//            let lastX = models.last?.body.positions.first??.x ?? bounds.width
//            let firstX = models.first?.body.positions.first??.x ?? bounds.width
//            linePath.addLine(to: CGPoint(x: lastX, y: bounds.height))
//            linePath.addLine(to: CGPoint(x: firstX, y: bounds.height))
//
//            let layer = CAShapeLayer()
//            layer.fillColor = UIColor.blue.withAlphaComponent(0.2).cgColor
//            layer.strokeColor = UIColor.clear.cgColor
//            layer.path = linePath.cgPath
//            layer.lineWidth = 1
////            layer.strokeColor = UIColor.white.cgColor
//            layer.addSublayer(lineLayer)
            return lineLayer
        }
        
        public static func bezierPath(models: [CGPoint]) -> UIBezierPath {
            
            let lineSmoothness: CGFloat = 0.16
            let path = UIBezierPath()
            
            var prePreviousPoint: CGPoint?
            var previousPoint: CGPoint?
            var currentPoint: CGPoint?
            var nextPoint: CGPoint?
            
            for (index, model) in models.enumerated() {
                
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
                    print("curr = \(currentPoint)")
                    print("fistControl = \(fistControl)")
                    print("secondControl = \(secondControl)")
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
