//
//  DataModel.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 23/10/20.
//

import Foundation

struct TriageData {
    
    var jalanNafas: JalanNafas
        enum JalanNafas {
            case paten
            case sumbatanSebagian
            case sumbatanTotal
        }
   
    
    var distress: Distress
    
        enum Distress {
            case RRnormal
            case tidakAda
            case ringan
            case sedang
            case berat
        }
    
    var respiratoryRate: RespiratoryRate
        enum RespiratoryRate {
            case komunikasiBaik
            case RRnormal
            case RRlessthan30
            case RRmorethan30
            case tidakMampuBicara
        }
    
        
    
    
    var hentiNafas: HentiNafas
        enum HentiNafas {
            case berhenti
            case pengunaanOtotBantu
        }
   
    var hipoventilasi: Bool
        
    
    

    
  //  -----------------------
    
    var hemodinamik: Hemodinamik
        enum Hemodinamik {
            case tidakAda
            case ringan
            case sedang
            case berat
        
        }
  
    
    var nadi: Nadi
        enum Nadi{
            case normal
            case teraba
            case lemahKuat
            case sangatHalus
            case tidakTeraba
        }
    
    
    var denyutNadi: DenyutNadi
        enum DenyutNadi {
            case teraba
            case kapilerLessthan2
            case kapilerMorethan2
            case perdarahanAktif
        }
    
        
   
    var warnaKulit: WarnaKulit
    
        enum WarnaKulit {
            case merahHangat
            case pucatMerahHangat
        }
    var gcs:
        Int
    //15
    //15
    //13<
    //9-12
    //8>
    
    var psikologis :Psikologis
        enum Psikologis {
            case kooperatif
            case agitasi
            case tidakKooperatif
        }

}

let data = [
    TriageData(jalanNafas: .paten, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 2, psikologis: .agitasi)
]
