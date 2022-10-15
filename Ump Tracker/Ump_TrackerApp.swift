/*
    Ump_TrackerApp.swift
    Ump Tracker

    Created by Simon Gil on 10/12/22.
*/

import SwiftUI

@main
struct Ump_TrackerApp: App {
    //  Variables
    @State var strikes : Int = 0
    @State var balls : Int = 0
    @State var outs : Int = 0
    @State var inning : Int = 0
    @State var top_inning : Bool = true
    @State var HOME_TEAM : String = ""
    @State var AWAY_TEAM : String = ""
    
    //  Functions
    
    //      Function for strikes
    func strike() {
        strikes += 1
        if (strikes >= 3) {
            out()
        }
    }
    //          End Function
    
    //      Function for Outs
    func out() {
        strikes = 0
        balls = 0
        outs += 1
        if (outs >= 3) {
            if (top_inning) {
                top_inning = false
            }
            else {
                top_inning = true
                inning += 1
            }
        }
    }
    //         End Function
    
    //      Function for balls
    func ball() {
        balls += 1
        if (balls >= 4) {
            balls = 0
            strikes = 0
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
