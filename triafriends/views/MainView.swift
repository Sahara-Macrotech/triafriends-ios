//
//  swiftui1App.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 19/10/20.
//

import SwiftUI

@main
struct MainView: App {
    @State var isPopUpEnabled = false
    let firestore = FirestoreController()
    let realtimeDb = RealtimeDBController()
    @AppStorage("email") var email = ""
    var body: some Scene {
        WindowGroup {
            if email == "" {
                LoginView()
            } else if ((email != "") && (UserDefaults.standard.dictionary(forKey: "credentials") == nil)) {
                SignMeUpCard()
            } else {
                MainViewApp()
            }
        }
    }
}
extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}

struct Triafriends_previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
