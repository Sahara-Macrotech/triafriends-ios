//
//  Algorithm.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 23/10/20.
//

import Foundation
import Combine
import SwiftUI


//Sistem kalkulasi triase

class Algo {
    //------------------------------------------------------------
    
   
    
    
    var result: ColorScale?
    enum ColorScale: Int {
        
        case category5 = 5
        //response time 120mnt
        //Hijau
        
        case category4 = 4
        //response time 60mnt
        //Kuning
        
        case category3 = 3
        //response time 30mnt
        //Kuning
        
        case category2 = 2
        //response time 10
        //Merah
        
        case category1 = 1
        //response time SEGERA
        //Merah
        
    }
    
    //----------------------------------------------------------------------
    
    
    //STATE untuk track value change di swift ui tapi apakah harus terjadi disini ya?
    
    var cat5: Int? = 0
    var cat4: Int? = 0
    var cat3: Int? = 0
    var cat2: Int? = 0
    var cat1: Int? = 0
    
    //----------------------------------------------
    
    //FUNCTIONS AHEAD//
    
    
    //JALAN NAFAS ---------- JALAN NAFAS
    func jalanNafasCalc(data: Triage) {
        if data.jalanNafas == .sumbatanSebagian {
            cat1! += 1
        } else if data.jalanNafas == .sumbatanTotal {
            cat1! += 1
        } else {
            cat5! += 1
        }
    }
    
    
    
    
    //PERNAFASAN ------------ PERNAFASAN
    func distressCalc(data: Triage) {
        if data.distress == .berat {
            cat1! += 1
        } else if data.distress == .sedang {
            cat2! += 1
        } else if data.distress == .ringan {
            cat3! += 1
        } else if data.distress == .tidakAda {
            cat4! += 1
        } else {
            cat5! += 1
        }
    }
    
    func respiratoryRateCalc(data: Triage) {
        if data.respiratoryRate == .tidakMampuBicara {
            cat1! += 1
        } else if data.respiratoryRate == .RRmorethan30 {
            cat2! += 1
        } else if data.respiratoryRate == .RRlessthan30 {
            cat3! += 1
        } else if data.respiratoryRate == .RRnormal {
            cat4! += 1
        } else {
            cat5! += 1
        }
    }
    
    func hentiNafasCalc(data: Triage) {
        if data.hentiNafas == .berhenti {
            cat1! += 1
        } else if data.hentiNafas == .pengunaanOtotBantu {
            cat2! += 1
        } else {
            cat5! += 1
        }
    }
    
    func hipoventilasiCalc(data: Triage) {
        if data.hipoventilasi == true {
            cat1! += 1
        } else {
            cat5! += 1
        }
    }
    
    
    
    
    
    //SIRKULASI -------------- SIRKULASI
    func hemodinamikCalc(data: Triage) {
        if data.hemodinamik == .berat  {
            cat1! += 1
        } else if data.hemodinamik == .sedang {
            cat2! += 1
        } else if data.hemodinamik == .ringan {
            cat3! += 1
        } else if data.hemodinamik == .tidakAda {
            cat5! += 1
        } else {
            cat5! += 1
        }
        
    }
    
    func nadiTerabaCalc(data: Triage) {
        if data.nadi == .tidakTeraba {
            cat1! += 1
        } else if data.nadi == .sangatHalus {
            cat2! += 1
        } else if data.nadi == .lemahKuat {
            cat3! += 1
        } else if data.nadi == .teraba {
            cat4! += 1
        } else {
            cat5! += 1
        }
    }
    
    func pendarahanCalc(data: Triage) {
        if data.denyutNadi == .perdarahanAktif {
            cat1! += 1
        } else if data.denyutNadi == .kapilerMorethan2 {
            cat2! += 1
            
        } else if data.denyutNadi == .kapilerLessthan2 {
            cat3! += 1
        } else {
            cat5! += 1
        }
    }
    
    
    
    func warnaKulitCalc(data: Triage) {
        if data.warnaKulit == .pucatMerahHangat {
            cat4! += 1
        } else {
            cat5! += 1
        }
    }
    
            //****cara bikin range number gitu gak sih****
    func comaScaleCalc(data: Triage) {
        if data.gcs == .belowEight {
            cat1! += 1
        } else if data.gcs == .nineToTwelve {
            cat2! += 1
        } else if data.gcs == .aboveThirteen {
            cat3! += 1
        } else {
            cat5! += 1
        }
       
    }
    
    
    
    func psikologisCalc(data: Triage) {
        if data.psikologis == .agitasi {
            cat4! += 1
        } else if data.psikologis == .tidakKooperatif {
            cat4! += 1
        } else {
            cat5! += 1
        }
    }
    
    //Buat function untuk track data lainnya seperti respiratory darah dan coma
    
    //-----------------------------------
    
    func calculateAll() -> ColorScale{
        
        var results: ColorScale = .category5
        
        if cat1! > 0 {
            results = .category1
        } else if cat2! > 0 {
            results = .category2
        } else if cat3! > 0 {
            results = .category3
        } else if cat4! > 0 {
            results = .category4
        } else if cat5! > 0 {
            results = .category5
        }
        cat2! += 1
        print(cat5)
        print(cat4)
        print(cat3)
        print(cat2)
        print(cat1)
        
        //return
        return results
    }
    func calc(triage: Triage) -> ColorScale{
        jalanNafasCalc(data: triage)
        distressCalc(data: triage)
        respiratoryRateCalc(data: triage)
        hentiNafasCalc(data: triage)
        hipoventilasiCalc(data: triage)
        hemodinamikCalc(data: triage)
        nadiTerabaCalc(data: triage)
        pendarahanCalc(data: triage)
        warnaKulitCalc(data: triage)
       comaScaleCalc(data: triage)
        psikologisCalc(data: triage)
        
       // calculateAll()
        
        return calculateAll()
    }
    
    
    
    
}
