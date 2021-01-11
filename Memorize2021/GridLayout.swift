//
//  GridLayout.swift
//  Memorize
//
//  Created by CS193p Instructor.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI

struct GridLayout {
    var size: CGSize
    var rowCount: Int = 0
    var columnCount: Int = 0
    
    init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        self.size = size
        // if our size is zero width or height or the itemCount is not > 0
        // then we have no work to do (because our rowCount & columnCount will be zero)
        guard size.width != 0, size.height != 0, itemCount > 0 else { return }
        // find the bestLayout
        // i.e., one which results in cells whose aspectRatio
        // has the smallestVariance from desiredAspectRatio
        // not necessarily most optimal code to do this, but easy to follow (hopefully)
        var bestLayout: (rowCount: Int, columnCount: Int) = (1, itemCount) // 1, 8
        
        var smallestVariance: Double?
        
        let sizeAspectRatio = abs(Double(size.width/size.height))
        // size is 400 / 1200 ... 0.333
        
        for rows in 1...itemCount {
            // row 1.... columns = 8, rows 2 columns = 4, row 3 columns = 3, row 4 columns 2, row 5 columns 2
            let columns = (itemCount / rows) + (itemCount % rows > 0 ? 1 : 0)
            
            if (rows - 1) * columns < itemCount {
                // row 1 -> true, row 2 -> true, row 3 -> true, row 4 -> true, row 5 -> false
                let itemAspectRatio = sizeAspectRatio * (Double(rows)/Double(columns))
                // itemAspectRatio: 0.333 * 1/8 = 0.04, 0.333 * 1/4 = 0.17, 0.333 * 1 = 0.333, row 4: 0.666, row 5 is false -> therefore row 4 columns 2 is superior
                let variance = abs(itemAspectRatio - desiredAspectRatio)
                // 0.04 - 1 = 0.96, 0.17 - 1 = 0.83, 0.67, 0.35
                if smallestVariance == nil || variance < smallestVariance! {
                    smallestVariance = variance
                    // 0.83... lower than 0.96,.... 0.67 better but best ist 0.35
                    bestLayout = (rowCount: rows, columnCount: columns)
                    // rowCount: 4, columns: 2
                }
            }
        }
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
    }
    
    var itemSize: CGSize {
        if rowCount == 0 || columnCount == 0 {
            return CGSize.zero
        } else {
            return CGSize(
                width: size.width / CGFloat(columnCount),
                height: size.height / CGFloat(rowCount)
            )
        }
    }
    
    func location(ofItemAt index: Int) -> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return CGPoint.zero
        } else {
            let point = CGPoint(
                x: (CGFloat(index % columnCount) + 0.5) * itemSize.width,
                y: (CGFloat(index / columnCount) + 0.5) * itemSize.height)
            print("Index \(index), CGPoint\(point)")
            return CGPoint(
                x: (CGFloat(index % columnCount) + 0.5) * itemSize.width,
                y: (CGFloat(index / columnCount) + 0.5) * itemSize.height)
                // for 400 x 1200 and 4 x 2 -> itemSize (200, 300)
                // index 0 -> x: 0.5 * 200 -> 100 / y: 0.5 * 300 -> 150)
                // index 1 -> x: 300 / y: 150)
                // index 2 -> x: 100 / y: 450)
            
        }
    }
}
