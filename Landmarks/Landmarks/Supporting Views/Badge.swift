//
//  Badge.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/30/20.
//

import SwiftUI

struct Badge: View {
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        // this allows us to grab values about the device
        GeometryReader { geometry in
            // outline of 2d shape use these variables
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(to: CGPoint(
                    x: xOffset + width * 0.95,
                    y: height * (0.20 + HexagonParameters.adjustment)
                ))
                
                // now we will draw the lines for the shape
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            // $0. is the closure, the second 0 if the first item in usewith since it is a tuple
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    // adds rounded edges
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        ))
                }
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)

            ))
            // makes this view stay square even if its ancestors are not
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
