//
//  FBButtonView.swift
//  triafriends
//
//  Created by Iswandi Saputra on 02/11/20.
//

import SwiftUI

struct FBButtonView: View {
    @Binding var buttonClick: Bool

          var body: some View {
            self.buttonClick.toggle()
            FaceBookLoginView().frame(width: 180, height: 50,alignment: .center).padding(10)
              
          }
}

//struct FBButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        FBButtonView()
//    }
//}


