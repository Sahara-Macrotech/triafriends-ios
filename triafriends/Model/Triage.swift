//
//  Triage.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI
import Combine
import FirebaseDatabase
import Firebase


struct Filter {
    
    var filterTypes: Filters
    enum Filters {
        case all
        case queue
        case handled
        case done
    }
    
}







//------------------------------------------------------------------------------------------------

struct Triage: Identifiable {
    
    //DATA DIRI NYA-----------------------------
    var id: String?
    var status: Int?
    var name: String?
    var patientState: PatientState?
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
    
    
    
    //THERES NO NORMAL CONDITION HUH?
    var hentiNafas: HentiNafas?
    enum HentiNafas: String {
        case berhenti = "Berhenti"
        case pengunaanOtotBantu = "Penggunaan Otot Bantu"
        case normal = "Normal"
    }
    //make it enum?
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
    let id: String
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
    let hentiNafas: String
    
}












//Dummy datas--------------------------------------------------------
var dummyTriages = [
    
    Triage(id: "1", status: 2, name: "arie may wibowo", patientState: .queue, jalanNafas: .paten, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 3, psikologis: .agitasi),
    
    Triage(id: "2", status: 0, name: "iswandi sahputra", patientState: .queue, jalanNafas: .paten, distress: .berat, respiratoryRate: .RRnormal, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .normal, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 2, psikologis: .agitasi),
    
    Triage(id: "3", status: 1, name: "samuel christian", patientState: .done, jalanNafas: .none, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 3, psikologis: .agitasi),
    
    Triage(id: "4", status: 0, name: "I*** S***", patientState: .queue),
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




class TriageListViewModel: ObservableObject{
    @Published var arrOfTriages: [Triage] = []
    @Published var text: String = ""
    func query(hospitalID: String){
        var ref: DatabaseReference!
        
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)/")
        //bisa juga with path, bisa juga masukin parameter
        ref.observe(.value) { (snapshot) in
            var arrOfReceivedTriage = [rootReceivedTriage]()

            for child in snapshot.children
            {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any] {
                    
                    
                    do{
                        let data = try? JSONSerialization.data(withJSONObject: dict, options: .sortedKeys)
                       
                        let decode = try? JSONDecoder().decode(rootReceivedTriage.self, from: data!)
                        
                      //  print(decode)
                        arrOfReceivedTriage.append(decode!)
                    
                        //print(arrOfReceivedTriage)
                        
                    } catch {
                        print("error decoding")
                    }
                }
           
            
            //print(all)
           
            }
            self.convertToTriage(receivedTriage: arrOfReceivedTriage)
            
            
         }
        
    }
    
    func convertToTriage(receivedTriage: [rootReceivedTriage]){
        //Append to this later
        arrOfTriages = []
        
        for i in receivedTriage{
            
            //ID
            var id = i.triage.id
            var name = i.triage.name
            var status = i.triage.status
            
            
            var ps: Triage.PatientState
            switch i.triage.patientState {
            case "handled":
                ps = .handled
            case "done":
                ps = .done
            default:
                ps = .queue
            }
            //Transform to enum
            
            //JALAN NAFAS
            var jN: Triage.JalanNafas
            switch i.triage.jalanNafas {
            case "p":
                jN = Triage.JalanNafas.paten
            case "ss":
                jN = Triage.JalanNafas.sumbatanSebagian
            case "st":
                jN = Triage.JalanNafas.sumbatanTotal
            default:
                jN = Triage.JalanNafas.paten
            }
            
            
            //DISTRESS
            var d: Triage.Distress
            switch i.triage.distress {
            case "rrn":
                d = Triage.Distress.RRnormal
            case "ta":
                d = Triage.Distress.tidakAda
            case "r":
                d = Triage.Distress.ringan
            case "s":
                d = Triage.Distress.sedang
            case "b":
                d = Triage.Distress.berat
            default:
                d = Triage.Distress.tidakAda
            }
            
            
            //RESPIRATORY RATE
            
            var rR: Triage.RespiratoryRate
            switch i.triage.respiratoryRate {
            case "kb":
                rR = Triage.RespiratoryRate.komunikasiBaik
            case "rrn":
                rR = Triage.RespiratoryRate.RRnormal
            case "rrl30":
                rR = Triage.RespiratoryRate.RRlessthan30
            case "rrm30":
                rR = Triage.RespiratoryRate.RRmorethan30
            case "tmb":
                rR = Triage.RespiratoryRate.tidakMampuBicara
            default:
                rR = Triage.RespiratoryRate.komunikasiBaik
            }
            
            
            
            //HENTI NAFAS
            var hN: Triage.HentiNafas
            switch i.triage.hentiNafas {
            case "b":
                hN = Triage.HentiNafas.berhenti
            case "pob":
                hN = Triage.HentiNafas.pengunaanOtotBantu
            default:
                //PUT NORMAL CONDITION HERE
                hN = .normal
                
            }
            
            
            //HIPOVENTILASI
            var hv: Bool
            switch i.triage.hipoventilasi {
            case "true":
                hv = true
            case "false":
                hv = false
            default:
                hv = false
            }
            //--------------------------------------
            
            //HEMODINAMIK
            var hd: Triage.Hemodinamik
            switch i.triage.hemodinamik {
            case "ta":
                hd = .tidakAda
            case "r":
                hd = .ringan
            case "s":
                hd = .sedang
            case "b":
                hd = .berat
            default:
                hd = .tidakAda
            }
            
            //NADI
            var n: Triage.Nadi
            switch i.triage.nadi {
            case "n":
                n = .normal
            case "t":
                n = .teraba
            case "lk":
                n = .lemahKuat
            case "sh":
                n = .sangatHalus
            case "tt":
                n = .tidakTeraba
            default:
                n = .normal
            }
            
            //DENYUT NADI
            var dN: Triage.DenyutNadi
            switch i.triage.denyutNadi {
            case "t":
                dN = .teraba
            case "kl2":
                dN = .kapilerLessthan2
            case "km2":
                dN = .kapilerMorethan2
            case "pa":
                dN = .perdarahanAktif
            default:
                dN = .teraba
            }
            
            //WARNA KULIT
            var wK: Triage.WarnaKulit
            switch i.triage.warnaKulit {
            case "mh":
                wK = .merahHangat
            case "pmh":
                wK = .pucatMerahHangat
            default:
                wK = .merahHangat
            }
            
            
            //Glassgow Comma Scale
            var gcs = i.triage.gcs
            
            
            
            
            var p: Triage.Psikologis
            switch i.triage.psikologis {
            case "k":
                p = .kooperatif
            case "a":
                p = .agitasi
            case "tk":
                p = .tidakKooperatif
            default:
                p = .kooperatif
            }
            
            
            DispatchQueue.main.async {
                
            
            self.arrOfTriages.append(Triage(id: id, status: status, name: name, patientState: ps, jalanNafas: jN, distress: d, respiratoryRate: rR, hentiNafas: hN, hipoventilasi: hv, hemodinamik: hd, nadi: n, denyutNadi: dN, warnaKulit: wK, gcs: gcs, psikologis: p))
               // print(self.arrOfTriages)
            }
        }
       
        // return arrOfTriage
        
        
       
    }
    
}




