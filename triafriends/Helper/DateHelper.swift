//
//  DateHelper.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 16/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import Foundation

class DateHelper {
    
    func getCurrentHour() -> String{
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        
        return "\(hour)"
    }
    
    func getCurrentMinute() -> String{
        let date = Date()
        let calendar = Calendar.current
        
        let minutes = calendar.component(.minute, from: date)
        
        return "\(minutes)"
    }
    
    func getCurrentSecond() -> String{
        let date = Date()
        let calendar = Calendar.current
    
        let seconds = calendar.component(.second, from: date)
        
        return "\(seconds)"
    }
    
    func getCurrentTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        return "\(hour):\(minutes):\(seconds)"
    }
    
    func getMinuteSecond() -> String{
        let date = Date()
        let calendar = Calendar.current
        
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        return "\(minutes):\(seconds)"
    }
    
    func getTimeDifference(minute1: Int, second1: Int, minute2: Int, second2: Int) -> String{
        if second1 < second2 {
            let second = (second1+60) - second2
            let minute = (minute1-1) - minute2
            return "\(minute):\(second)"
        }
        let second = second1 - second2
        let minute = minute1 - minute2
        return "\(minute):\(second)"
    }
}
