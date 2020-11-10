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
    var color: Color
    var value: CGFloat
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
        //print(lastBarEndAngle.degrees)
        return lastBarEndAngle
    }
}
struct ChartViewModels {


@ObservedObject var triageListViewModel: TriageListViewModel = TriageListViewModel.sharedInstance
    
    func getNumbersForChart (startDate: Date, endDate: Date) -> (g: Int, r: Int, y: Int, b: Int){
    
            
        
        var x = triageListViewModel.arrOfTriages.filter { (item) in
           // print(item)
            var start = startDate
            var end = endDate
            var now = item.date
            var range = start...end
            return item.status == 5 && range.contains(now!)
           
        }
        var y = triageListViewModel.arrOfTriages.filter { (item) -> Bool in
            var start = startDate
            var end = endDate
            var now = item.date
            var range = start...end
            return item.status == 1 && range.contains(now!) || item.status == 2 && range.contains(now!)
           
        }
        var z = triageListViewModel.arrOfTriages.filter { (item) -> Bool in
            var start = startDate
            var end = endDate
            var now = item.date
            var range = start...end
            return item.status == 3 && range.contains(now!) || item.status == 4 && range.contains(now!)
           
        }
        
        var b = triageListViewModel.arrOfTriages.filter { (item) -> Bool in
            var start = startDate
            var end = endDate
            var now = item.date
            var range = start...end
            return item.status == 6 && range.contains(now!)
        }
        
        var yellow = z.count // 
        var green = x.count //
        var red = y.count //
        var black = b.count //
        
            return (green, red, yellow, black)
        
    }
    
    
    
    let sample = [ ChartCellModel(color: colorRed, value: 120, name: "Gawat Darurat"),
               ChartCellModel(color: colorYellow, value: 143, name: "Gawat Tidak Darurat"),
               
               ChartCellModel(color: colorGreen, value: 120, name: "Darurat Tidak Gawat"),
               ChartCellModel(color: Color.black, value: 47, name: "Tidak Gawat Tidak Darurat") ]
    
}
