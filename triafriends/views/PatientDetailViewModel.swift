//
//  PatientDetailViewModel.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 13/11/20.
//

import Foundation
import SwiftUI

class convert {
    func airToColor(input: Triage.JalanNafas) -> Color {
        var color: Color
        
        if input == .paten {
            color = colorGreen
        } else {
            color = colorRed
        }
        return color
    }
    
    func disToColor(input: Triage.Distress) -> Color {
        var color: Color
        
        if input == .RRnormal{
            color = colorGreen
        } else if input == .tidakAda || input == .ringan {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func rrToColor(input: Triage.RespiratoryRate) -> Color {
        var color: Color
        
        if input == .komunikasiBaik {
            color = colorGreen
        } else if input == .RRnormal || input == .RRlessthan30 {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func hnToColor(input: Triage.HentiNafas) -> Color{
        var color: Color
        
        if input == .normal {
            color = colorGreen
        } else {
            color = colorRed
        }
        return color
    }
    
    func hvToColor(input: Bool) -> Color {
        var color: Color
        
        if input == false {
            color = colorGreen
        } else {
            color = colorRed
        }
        return color
    }
    
    func hdToColor(input: Triage.Hemodinamik) -> Color{
        var color: Color
        
        if input == .tidakAda {
            color = colorGreen
        } else if input == .ringan {
            color = colorYellow
        } else {
            color = colorRed
        }
        
        return color
    }
    
    func nadiToColor(input: Triage.Nadi) -> Color{
        var color: Color
        
        if input == .normal {
            color = colorGreen
        } else if input == .teraba || input == .lemahKuat {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func bleedingToColor(input: Triage.DenyutNadi) -> Color {
        var color: Color
        
        if input == .teraba {
            color = colorGreen
            
        } else if input == .kapilerLessthan2 {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func wkToColor(input: Triage.WarnaKulit) -> Color{
        var color: Color
        
        if input == .merahHangat {
            color = colorGreen
        } else {
            color = colorYellow
        }
        return color
    }
    
    func gcsToColor(input: Triage.GCS) -> Color {
        
        var color: Color
        
        if input == .fifteen {
            color = colorGreen
        } else if input == .aboveThirteen {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    
    
    
    //PSI COLOR
    func psiToColor(input: Triage.Psikologis) -> Color{
        var color: Color
        
        if input == .kooperatif {
            color = colorGreen
        } else {
            color = colorYellow
        }
        return color
    }
}
