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
        case limitToFive
        case black
    }
    
}







//------------------------------------------------------------------------------------------------

struct Triage: Identifiable {
    
    //DATA DIRI NYA-----------------------------
    var id: String?
    var status: Int?
    var name: String?
    var createdTime: Double?
    var date: Date?
    var patientState: PatientState?
    enum PatientState: String {
        case queue = "Queue"
        case handled = "Handled"
        case done = "Done"
        
    }
    
    
    
    //TRIASENYA----------------------------------------
    var jalanNafas: JalanNafas?
    enum JalanNafas: String {
        case paten = "Patent"
        case sumbatanSebagian = "Partial Blockage"
        case sumbatanTotal = "Total Blockage"
    }
    
    
    var distress: Distress?
    
    enum Distress: String {
        case RRnormal = "RR is normal"
        case tidakAda = "No distress exhalation"
        case ringan = "Light respiratory distress"
        case sedang = "Moderate respiratory distress"
        case berat = "Severe respiratory distress"
    }
    
    var respiratoryRate: RespiratoryRate?
    enum RespiratoryRate: String {
        case komunikasiBaik = "Can communicate well"
        case RRnormal = "RR is normal"
        case RRlessthan30 = "RR < 30 x/minute"
        case RRmorethan30 = "RR > 30 x/minute"
        case tidakMampuBicara = "Unable to speak"
    }
    
    
    
    //THERES NO NORMAL CONDITION HUH?
    var hentiNafas: HentiNafas?
    enum HentiNafas: String {
        case berhenti = "Stop breathing"
        case pengunaanOtotBantu = "Use of auxiliary muscles breath"
        case normal = "Normal"
    }
    //make it enum?
    var hipoventilasi: Bool?
    
    
    
    
    
    //  -----------------------
    
    var hemodinamik: Hemodinamik?
    enum Hemodinamik: String {
        case tidakAda = "No hemodynamic disturbances"
        //tidakada
        case ringan = "Mild hemodynamic disturbances"
        case sedang = "Moderate hemodynamic disturbances"
        case berat = "Severe hemodynamic disturbances"
        
    }
    
    
    var nadi: Nadi?
    enum Nadi: String{
        case normal = "Normal pulse"
        case teraba = "Pulse palpable"
        case lemahKuat = "Weak-strong"
        case sangatHalus = "Pulse is not palpable / very smooth"
        case tidakTeraba = "Pulse is not palpable / cardiac arrest"
    }
    
    
    var denyutNadi: DenyutNadi?
    enum DenyutNadi: String {
        case teraba = "Peripheral pulse is palpable"
        case kapilerLessthan2 = "Capillary refill < 2 seconds"
        case kapilerMorethan2 = "Capillary refill > 2 seconds"
        case perdarahanAktif = "Uncontrolled / active bleeding"
    }
    
    
    
    var warnaKulit: WarnaKulit?
    enum WarnaKulit: String {
        case merahHangat = "Reddish skin with warm acral"
        case pucatMerahHangat = "Pale skin reddish warm acral"
    }
    
    //GCS  MASIH INTEGER
    var gcs:
        GCS
    enum GCS: String{
        case belowEight = "Below 8"
        case nineToTwelve = "9-12"
        case aboveThirteen = "Above 13"
        case fifteen = "15"
    }
    //15
    //15
    //13<
    //9-12
    //8>
    
    var psikologis :Psikologis?
    enum Psikologis: String {
        case kooperatif = "Cooperative"
        case agitasi = "Agitation"
        case tidakKooperatif = "Not cooperative"
        
        
        
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
    let gcs: String
    let hemodinamik: String
    let hipoventilasi: String
    let jalanNafas: String
    let nadi: String
    let name: String
    let createAt: Double
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
 
    func stringToTriage(receivedTriage: TempTriageResult) -> Triage{
        //Append to this later
        //        arrOfTriages = []
       
        let group = DispatchGroup()
        var triase: Triage
       
           
                
                //ID
           //     var id = "id"
            var name = receivedTriage.getName()
             //   var status = recei
                
//
//                var ps: Triage.PatientState
//                switch i.triage.patientState {
//                case Triage.PatientState.handled.rawValue:
//                    ps = .handled
//                case Triage.PatientState.done.rawValue:
//                    ps = .done
//                default:
//                    ps = .queue
//                }
                //Transform to enum
                
                //JALAN NAFAS
                var jN: Triage.JalanNafas
            switch receivedTriage.getAirway() {
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
            switch receivedTriage.getRespitoryDistress() {
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
            switch receivedTriage.getSpeak() {
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
            switch receivedTriage.getBreath() {
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
            switch receivedTriage.getHipoventilasi() {
                case "Yes":
                    hv = true
                case "No":
                    hv = false
                default:
                    hv = false
                }
                //--------------------------------------
                
                //HEMODINAMIK
                var hd: Triage.Hemodinamik
            switch receivedTriage.getEmodynamicDisturbance() {
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
            switch receivedTriage.getPulse() {
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
            switch receivedTriage.getBleeding() {
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
            switch receivedTriage.getSkinCondition() {
                case Triage.WarnaKulit.merahHangat.rawValue:
                    wK = .merahHangat
                case Triage.WarnaKulit.pucatMerahHangat.rawValue:
                    wK = .pucatMerahHangat
                default:
                    wK = .merahHangat
                }
                
                
                
                
                var p: Triage.Psikologis
            switch receivedTriage.getMentalState() {
                case Triage.Psikologis.kooperatif.rawValue:
                    p = .kooperatif
                case Triage.Psikologis.agitasi.rawValue:
                    p = .agitasi
                case Triage.Psikologis.tidakKooperatif.rawValue:
                    p = .tidakKooperatif
                default:
                    p = .kooperatif
                }
        
        var gcs: Triage.GCS
        switch receivedTriage.getGCS() {
        case Triage.GCS.belowEight.rawValue:
            gcs = .belowEight
        case Triage.GCS.nineToTwelve.rawValue:
            gcs = .nineToTwelve
        case Triage.GCS.aboveThirteen.rawValue:
            gcs = .aboveThirteen
        case Triage.GCS.fifteen.rawValue:
            gcs = .fifteen
        default:
            gcs = .fifteen
        }
                
                
                
               // var sT = i.triage.startTime
               // var eT = i.triage.endTime
        triase = Triage(name: name, patientState: .queue, jalanNafas: jN, distress: d, respiratoryRate: rR, hentiNafas: hN, hipoventilasi: hv, hemodinamik: hd, nadi: n, denyutNadi: dN, warnaKulit: wK, gcs: gcs, psikologis: p, startTime: 100, endTime: 100)
              
            
            
            
                
          
        
        
        
        return triase
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
                
                
                //JSONDecoder mendecode timestamp dari firebase tipe data Double
                
                
                
                var createdTime = i.triage.createAt // createAt diquery dari firebase dengan format Double. Valuenya adalah jumlah detik setelah tahun 1970
                //VALUE: 1604628329
                
        
                let timestamp = Date(timeIntervalSince1970: createdTime) // Ini mengubah jumlah detik setelah 1970 menjadi tanggal
                //VALUE: 2020-11-06 17:00:00 +0000
                
                
                
                
                
                
                
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
                
                var gcs: Triage.GCS
                switch i.triage.gcs {
                case Triage.GCS.belowEight.rawValue:
                    gcs = .belowEight
                case Triage.GCS.nineToTwelve.rawValue:
                    gcs = .nineToTwelve
                case Triage.GCS.aboveThirteen.rawValue:
                    gcs = .aboveThirteen
                case Triage.GCS.fifteen.rawValue:
                    gcs = .fifteen
                default:
                    gcs = .fifteen
                }
                
                
                var sT = i.triage.startTime
                var eT = i.triage.endTime
                tempArray.append(Triage(id: id, status: status, name: name,  createdTime: createdTime,date: timestamp, patientState: ps, jalanNafas: jN, distress: d, respiratoryRate: rR, hentiNafas: hN, hipoventilasi: hv, hemodinamik: hd, nadi: n, denyutNadi: dN, warnaKulit: wK, gcs: gcs, psikologis: p, startTime: sT, endTime: eT))
                print(tempArray.count)
            }
            
            
                
            group.leave()
//
//            self.arrOfTriages.append(Triage(id: id, status: status, name: name, patientState: ps, jalanNafas: jN, distress: d, respiratoryRate: rR, hentiNafas: hN, hipoventilasi: hv, hemodinamik: hd, nadi: n, denyutNadi: dN, warnaKulit: wK, gcs: gcs, psikologis: p, startTime: sT, endTime: eT))
//               // print(self.arrOfTriages)
            
        }
        
        group.notify(queue: .main, execute: {
            print("Sahara Pasti Bisa")
            self.arrOfTriages = tempArray
        })
    }
    
    
    // return arrOfTriage
    
}




