//
//  PieChartCellModels.swift
//  triafriends
//
//  Created by Iswandi Saputra on 02/11/20.
//

import Foundation
import SwiftUI

struct ChartCellModel: Identifiable {
    let id = UUID()
    let color: Color
    let value: CGFloat
    let name: String
}

final class ChartDataModel: ObservableObject {
    var chartCellModel: [ChartCellModel]
    var startingAngle = Angle(degrees: 0)
    private var lastBarEndAngle = Angle(degrees: 0)
    
        
    init(dataModel: [ChartCellModel]) {
        chartCellModel = dataModel
    }
    
    var totalValue: CGFloat {
        chartCellModel.reduce(CGFloat(0)) { (result, data) -> CGFloat in
            result + data.value
        }
    }
    
    func angle(for value: CGFloat) -> Angle {
        if startingAngle != lastBarEndAngle {
            startingAngle = lastBarEndAngle
        }
        lastBarEndAngle += Angle(degrees: Double(value / totalValue) * 360 )
        print(lastBarEndAngle.degrees)
        return lastBarEndAngle
    }
}

let sample = [ ChartCellModel(color: Color.red, value: 162, name: "Gawat Darurat"),
               ChartCellModel(color: Color.yellow, value: 143, name: "Gawat Tidak Darurat"),
               
               ChartCellModel(color: Color.green, value: 320, name: "Darurat Tidak Gawat"),
               ChartCellModel(color: Color.black, value: 47, name: "Tidak Gawat Tidak Darurat") ]
