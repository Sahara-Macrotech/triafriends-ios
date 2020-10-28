//
//  DataModel.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 23/10/20.
//

import Foundation

struct TriageData {
    
    var jalanNafas: JalanNafas?
    enum JalanNafas: String {
            case paten = "Paten"
            case sumbatanSebagian = "Sumbatan Sebagian"
            case sumbatanTotal = "Sumbatan Total"
        }
   
    
    var distress: Distress?
    
    enum Distress: String {
            case RRnormal = "RR Normal"
            case tidakAda = "Tidak ada"
            case ringan = "Ringan"
            case sedang = "Sedang"
            case berat = "Berat"
        }
    
    var respiratoryRate: RespiratoryRate
    enum RespiratoryRate: String {
            case komunikasiBaik = "Komunikasi Baik"
            case RRnormal = "RR Normal"
            case RRlessthan30 = "RR < 30"
            case RRmorethan30 = "RR > 30"
            case tidakMampuBicara = "Tidak mampu bicara"
        }
    
        
    
    
    var hentiNafas: HentiNafas
    enum HentiNafas: String {
            case berhenti = "Berhenti"
            case pengunaanOtotBantu = "Penggunaan Otot Bantu"
        }
   
    var hipoventilasi: Bool
        
    
    

    
  //  -----------------------
    
    var hemodinamik: Hemodinamik
    enum Hemodinamik: String {
            case tidakAda = "Tidak ada"
            //tidakada
            case ringan = "Ringan"
            case sedang = "Sedang"
            case berat = "Berat"
        
        }
  
    
    var nadi: Nadi
    enum Nadi: String{
            case normal = "Normal"
            case teraba = "Teraba"
            case lemahKuat = "Lemah Kuat"
            case sangatHalus = "Sangat Halus"
            case tidakTeraba = "Tidak Teraba"
        }
    
    
    var denyutNadi: DenyutNadi
    enum DenyutNadi: String {
            case teraba = "Teraba"
            case kapilerLessthan2 = "Kapiler < 2detik"
            case kapilerMorethan2 = "Kapiler > 2detik"
            case perdarahanAktif = "Perdarahan aktif"
        }
    
        
   
    var warnaKulit: WarnaKulit
    enum WarnaKulit: String {
            case merahHangat = "Merah Hangat"
            case pucatMerahHangat = "Pucat Merah Hangat"
        }
    
    //GCS  MASIH INTEGER
    var gcs:
        Int
    //15
    //15
    //13<
    //9-12
    //8>
    
    var psikologis :Psikologis
    enum Psikologis: String {
            case kooperatif = "Kooperatif"
            case agitasi = "Agitasi"
            case tidakKooperatif = "Tidak kooperatif"
        }
    
  

}

let data = [
    TriageData(jalanNafas: .paten, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 2, psikologis: .agitasi)
]
