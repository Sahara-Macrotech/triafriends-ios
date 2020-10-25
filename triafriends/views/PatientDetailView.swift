//
//  PatientDetailView.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 24/10/20.
//

import SwiftUI

struct PatientDetailView: View {
    var triages: Triage?
    var body: some View {
        Text(triages!.name)
    }
}

struct PatientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PatientDetailView()
    }
}
