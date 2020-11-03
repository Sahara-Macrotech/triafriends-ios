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
        case red
        case yellow
        case green
        case date
        case black
    }
    
}







//------------------------------------------------------------------------------------------------

struct Triage: Identifiable {
    
    //DATA DIRI NYA-----------------------------
    var id: String?
    var status: Int?
    var name: String?
    var patientState: PatientState?
    enum PatientState: String {
        case queue = "Queue"
        case handled = "Handled"
        case done = "Done"
        
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
    
    var startTime: Int
    var endTime: Int
    
    
    
    
    
    
    
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
    
    //Next pake time formatter
    let startTime: Int
    let endTime: Int
    
}












//Dummy datas--------------------------------------------------------
//var dummyTriages = [
//    
//    Triage(id: "1", status: 2, name: "arie may wibowo", patientState: .queue, jalanNafas: .paten, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 3, psikologis: .agitasi),
//    
//    Triage(id: "2", status: 0, name: "iswandi sahputra", patientState: .queue, jalanNafas: .paten, distress: .berat, respiratoryRate: .RRnormal, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .normal, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 2, psikologis: .agitasi),
//    
//    Triage(id: "3", status: 1, name: "samuel christian", patientState: .done, jalanNafas: .none, distress: .RRnormal, respiratoryRate: .RRlessthan30, hentiNafas: .berhenti, hipoventilasi: true, hemodinamik: .berat, nadi: .lemahKuat, denyutNadi: .kapilerLessthan2, warnaKulit: .merahHangat, gcs: 3, psikologis: .agitasi),
//    
//    
//]

var arr = ["ab","cc","dd","ae"]




class TriageListViewModel: ObservableObject{
    
    static let sharedInstance = TriageListViewModel()
    
    @Published var arrOfTriages: [Triage] = []
    @Published var text: String = ""
    
    func test(handler: @escaping (([Triage]) -> Void)) -> Void {
        handler(arrOfTriages)
    }
    
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
        //        arrOfTriages = []
        var tempArray: [Triage] = []
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            group.enter()
            for i in receivedTriage{
                
                //ID
                var id = i.triage.id
                var name = i.triage.name
                var status = i.triage.status
                
                
                
                var ps: Triage.PatientState
                switch i.triage.patientState {
                case Triage.PatientState.handled.rawValue:
                    ps = .handled
                case Triage.PatientState.done.rawValue:
                    ps = .done
                default:
                    ps = .queue
                }
                //Transform to enum
                
                //JALAN NAFAS
                var jN: Triage.JalanNafas
                switch i.triage.jalanNafas {
                case Triage.JalanNafas.paten.rawValue:
                    jN = Triage.JalanNafas.paten
                case Triage.JalanNafas.sumbatanSebagian.rawValue:
                    jN = Triage.JalanNafas.sumbatanSebagian
                case Triage.JalanNafas.sumbatanTotal.rawValue:
                    jN = Triage.JalanNafas.sumbatanTotal
                default:
                    jN = Triage.JalanNafas.paten
                }
                
                
                //DISTRESS
                var d: Triage.Distress
                switch i.triage.distress {
                case Triage.Distress.RRnormal.rawValue:
                    d = Triage.Distress.RRnormal
                case Triage.Distress.tidakAda.rawValue:
                    d = Triage.Distress.tidakAda
                case Triage.Distress.ringan.rawValue:
                    d = Triage.Distress.ringan
                case Triage.Distress.sedang.rawValue:
                    d = Triage.Distress.sedang
                case Triage.Distress.berat.rawValue:
                    d = Triage.Distress.berat
                default:
                    d = Triage.Distress.tidakAda
                }
                
                
                //RESPIRATORY RATE
                
                var rR: Triage.RespiratoryRate
                switch i.triage.respiratoryRate {
                case Triage.RespiratoryRate.komunikasiBaik.rawValue:
                    rR = Triage.RespiratoryRate.komunikasiBaik
                case Triage.RespiratoryRate.RRnormal.rawValue:
                    rR = Triage.RespiratoryRate.RRnormal
                case Triage.RespiratoryRate.RRlessthan30.rawValue:
                    rR = Triage.RespiratoryRate.RRlessthan30
                case Triage.RespiratoryRate.RRmorethan30.rawValue:
                    rR = Triage.RespiratoryRate.RRmorethan30
                case Triage.RespiratoryRate.tidakMampuBicara.rawValue:
                    rR = Triage.RespiratoryRate.tidakMampuBicara
                default:
                    rR = Triage.RespiratoryRate.komunikasiBaik
                }
                
                
                
                //HENTI NAFAS
                var hN: Triage.HentiNafas
                switch i.triage.hentiNafas {
                case Triage.HentiNafas.berhenti.rawValue:
                    hN = Triage.HentiNafas.berhenti
                case Triage.HentiNafas.pengunaanOtotBantu.rawValue:
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
                case Triage.Hemodinamik.tidakAda.rawValue:
                    hd = .tidakAda
                case Triage.Hemodinamik.ringan.rawValue:
                    hd = .ringan
                case Triage.Hemodinamik.sedang.rawValue:
                    hd = .sedang
                case Triage.Hemodinamik.berat.rawValue:
                    hd = .berat
                default:
                    hd = .tidakAda
                }
                
                //NADI
                var n: Triage.Nadi
                switch i.triage.nadi {
                case Triage.Nadi.normal.rawValue:
                    n = .normal
                case Triage.Nadi.teraba.rawValue:
                    n = .teraba
                case Triage.Nadi.lemahKuat.rawValue:
                    n = .lemahKuat
                case Triage.Nadi.sangatHalus.rawValue:
                    n = .sangatHalus
                case Triage.Nadi.tidakTeraba.rawValue:
                    n = .tidakTeraba
                default:
                    n = .normal
                }
                
                //DENYUT NADI
                var dN: Triage.DenyutNadi
                switch i.triage.denyutNadi {
                case Triage.DenyutNadi.teraba.rawValue:
                    dN = .teraba
                case Triage.DenyutNadi.kapilerLessthan2.rawValue:
                    dN = .kapilerLessthan2
                case Triage.DenyutNadi.kapilerMorethan2.rawValue:
                    dN = .kapilerMorethan2
                case Triage.DenyutNadi.perdarahanAktif.rawValue:
                    dN = .perdarahanAktif
                default:
                    dN = .teraba
                }
                
                //WARNA KULIT
                var wK: Triage.WarnaKulit
                switch i.triage.warnaKulit {
                case Triage.WarnaKulit.merahHangat.rawValue:
                    wK = .merahHangat
                case Triage.WarnaKulit.pucatMerahHangat.rawValue:
                    wK = .pucatMerahHangat
                default:
                    wK = .merahHangat
                }
                
                
                //Glassgow Comma Scale
                var gcs = i.triage.gcs
                
                
                
                
                var p: Triage.Psikologis
                switch i.triage.psikologis {
                case Triage.Psikologis.kooperatif.rawValue:
                    p = .kooperatif
                case Triage.Psikologis.agitasi.rawValue:
                    p = .agitasi
                case Triage.Psikologis.tidakKooperatif.rawValue:
                    p = .tidakKooperatif
                default:
                    p = .kooperatif
                }
                
                
                var sT = i.triage.startTime
                var eT = i.triage.endTime
                tempArray.append(Triage(id: id, status: status, name: name, patientState: ps, jalanNafas: jN, distress: d, respiratoryRate: rR, hentiNafas: hN, hipoventilasi: hv, hemodinamik: hd, nadi: n, denyutNadi: dN, warnaKulit: wK, gcs: gcs, psikologis: p, startTime: sT, endTime: eT))
                print(tempArray.count)
            }
            
            
                
            group.leave()
//
//            self.arrOfTriages.append(Triage(id: id, status: status, name: name, patientState: ps, jalanNafas: jN, distress: d, respiratoryRate: rR, hentiNafas: hN, hipoventilasi: hv, hemodinamik: hd, nadi: n, denyutNadi: dN, warnaKulit: wK, gcs: gcs, psikologis: p, startTime: sT, endTime: eT))
//               // print(self.arrOfTriages)
            
        }
        
        group.notify(queue: .main, execute: {
            print("gila")
            self.arrOfTriages = tempArray
        })
    }
    
    
    // return arrOfTriage
    
}




