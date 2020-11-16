//
//  CloseButton.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 02/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct CloseButton: View {
    @Binding var rootIsActive: Bool
    @Binding var closeButtonIsPressed: Bool
    
    var body: some View {
        Button (action: {
            closeButtonIsPressed.toggle()
        }) {
            Image(systemName: "xmark")
            .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
        }
      
    }
}

//struct CloseButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CloseButton()
//    }
//}
