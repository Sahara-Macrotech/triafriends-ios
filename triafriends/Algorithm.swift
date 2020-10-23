//
//  Algorithm.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 23/10/20.
//

import Foundation
import Combine
import SwiftUI




struct a {
    //------------------------------------------------------------
    
   
    
    
    var result: ColorScale?
    enum ColorScale {
        
        case category5
        //response time 120mnt
        //Hijau
        
        case category4
        //response time 60mnt
        //Kuning
        
        case category3
        //response time 30mnt
        //Kuning
        
        case category2
        //response time 10
        //Merah
        
        case category1
        //response time SEGERA
        //Merah
        
    }
    
    //----------------------------------------------------------------------
    
    
    //STATE untuk track value change di swift ui tapi apakah harus terjadi disini ya?
    
    @State var cat5: Int
    @State var cat4: Int
    @State var cat3: Int
    @State var cat2: Int
    @State var cat1: Int
    
    
    func nafas(data: TriageData, scale: ColorScale) {
        if data.hemodinamik == .berat  {
            cat1 += 1
        } else if data.hemodinamik == .sedang {
            cat2 += 1
        } else if data.hemodinamik == .ringan {
            cat3 += 1
        } else if data.hemodinamik == .tidakAda {
            cat4 += 1
        } else {
            cat5 += 1
        }
        
    }
    //-------------
    
    func calculateAll() -> ColorScale{
        
        var results: ColorScale = .category5
        
        if cat1 > 0 {
            results = .category1
        } else if cat2 > 0 {
            results = .category2
        } else if cat3 > 0 {
            results = .category3
        } else if cat4 > 0 {
            results = .category4
        } else if cat5 > 0 {
            results = .category5
        }
        
        //return
        return results
    }
    
    
    
    
}
