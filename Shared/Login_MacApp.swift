//
//  Login_MacApp.swift
//  Shared
//
//  Created by Michele Manniello on 17/02/21.
//

import SwiftUI

@main
struct Login_MacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        Hidding the title bar
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
//Hidding Textfield Focus Ring...
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
