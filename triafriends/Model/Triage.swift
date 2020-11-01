//
//  Triage.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI


struct Filter {
    
    var filterTypes: Filters
    enum Filters {
        case all
        case queue
        case handled
        case done
    }
    
    }
//-------------------------------------------------------------------------------------------
//
//struct PatientData{
//    var denyutNadi: String
//    var distress:  String//dst
//}
//
//struct Patient{
//    var  patients: [String: PatientData]
//}
//
//struct RecievedTriage{
//
//    var  hospitals: [String: [Patient]]
//
//    func transformToTriageObject()->[Triage]{
//        let triages: [Triage] = []
//
//        for hospital in hospitals{
//            let  patients = hospital.value
//            for patient in patients{
//                let patients = patient.patients
//
//                for patient in patients {
//                    let patientData = patient.value
//                    var distress: Triage.Distress
//
//                    switch patientData.distress {
//                    case "tidak ada" :
//                        distress = Triage.Distress.tidakAda
//                    default:
//                        distress = Triage.Distress.tidakAda
//                    }
//
//                    //                let newTriage  = Triage()
//                    let denyutNadi = patientData.denyutNadi
//
//
//
//
//            }
//        }
//
//        return triages
//
//    }
//}
//
//
//






//------------------------------------------------------------------------------------------------

struct Triage: Identifiable {
    
    //DATA DIRI NYA-----------------------------
    var id: String
    var status: Int
    var name: String
    var patientState: PatientState
    enum PatientState {
        case queue
        case handled
        case done
        
    }
    
    
    
    //TRIASENYA----------------------------------------
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
    
    var respiratoryRate: RespiratoryRate?
    enum RespiratoryRate: String {
            case komunikasiBaik = "Komunikasi Baik"
            case RRnormal = "RR Normal"
            case RRlessthan30 = "RR < 30"
            case RRmorethan30 = "RR > 30"
            case tidakMampuBicara = "Tidak mampu bicara"
        }
    
        
    
    
    var hentiNafas: HentiNafas?
    enum HentiNafas: String {
            case berhenti = "Berhenti"
            case pengunaanOtotBantu = "Penggunaan Otot Bantu"
        }
   
    var hipoventilasi: Bool?
        
    
    

    
  //  -----------------------
    
    var hemodinamik: Hemodinamik?
    enum Hemodinamik: String {
            case tidakAda = "Tidak ada"
            //tidakada
            case ringan = "Ringan"
            case sedang = "Sedang"
            case berat = "Berat"
        
        }
  
    
    var nadi: Nadi?
    enum Nadi: String{
            case normal = "Normal"
            case teraba = "Teraba"
            case lemahKuat = "Lemah Kuat"
            case sangatHalus = "Sangat Halus"
            case tidakTeraba = "Tidak Teraba"
        }
    
    
    var denyutNadi: DenyutNadi?
    enum DenyutNadi: String {
            case teraba = "Teraba"
            case kapilerLessthan2 = "Kapiler < 2detik"
            case kapilerMorethan2 = "Kapiler > 2detik"
            case perdarahanAktif = "Perdarahan aktif"
        }
    
        
   
    var warnaKulit: WarnaKulit?
    enum WarnaKulit: String {
            case merahHangat = "Merah Hangat"
            case pucatMerahHangat = "Pucat Merah Hangat"
        }
    
    //GCS  MASIH INTEGER
    var gcs:
        Int?
    //15
    //15
    //13<
    //9-12
    //8>
    
    var psikologis :Psikologis?
    enum Psikologis: String {
            case kooperatif = "Kooperatif"
            case agitasi = "Agitasi"
            case tidakKooperatif = "Tidak kooperatif"
        }
    
    
  
    
    
    
    
    
}



struct rootReceivedTriage: Codable {
    let triage: ReceivedTriage
}
struct ReceivedTriage: Codable {
    let denyutNadi: String
    let distress: String
    let gcs: Int
    let hemodinamik: String
    let hipoventilasi: String
    let jalanNafas: String
    let nadi: String
    let name: String
    let patientState: String
    let psikologis: String
    let respiratoryRate: String
    let status: Int
    let warnaKulit: String
    
}












//Dummy datas--------------------------------------------------------
var triages = [
    
    Triage(id: "1", status: 2, name: "arie may wibowo", patientState: .queue, jalanNafas: .paten, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 3, psikologis: .agitasi),
    
    Triage(id: "2", status: 0, name: "iswandi sahputra", patientState: .queue, jalanNafas: .paten, distress: .berat, respiratoryRate: .RRnormal, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .normal, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 2, psikologis: .agitasi),
    
    Triage(id: "3", status: 1, name: "samuel christian", patientState: .done, jalanNafas: .none, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 3, psikologis: .agitasi),
    
    Triage(id: "4", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "5", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "6", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "7", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "8", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "9", status: 1, name: "I*** S***", patientState: .handled),
    Triage(id: "10", status: 1, name: "H*** H***", patientState: .handled),
    Triage(id: "11", status: 1, name: "H*** H***", patientState: .handled),
    Triage(id: "12", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "13", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "14", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "15", status: 1, name: "D*** D***", patientState: .done),
    Triage(id: "16", status: 1, name: "D*** D***", patientState: .done),
    

]

var arr = ["ab","cc","dd","ae"]

//
//arr.filter { (str) -> Bool in
//    return str.contains("a")

//
//triages.filter { (Triage) -> Bool in
//  return  Triage.patientState == .done

//}
