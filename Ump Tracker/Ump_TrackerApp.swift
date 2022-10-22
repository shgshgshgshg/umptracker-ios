/*
    Ump_TrackerApp.swift
    Ump Tracker

    Created by Simon Gil on 10/12/22.
*/

import SwiftUI

@main
struct Ump_TrackerApp: App {
    //  Variables
    struct Count {
        @State var a_strikes : Int = 0
        @State var a_balls : Int = 0
        @State var a_outs : Int = 0
        @State var a_inning : Int = 1
        @State var a_top_inning : Bool = true
        @State var a_HOME_TEAM : String = ""
        @State var a_AWAY_TEAM : String = ""
        @State var a_home_points : Int = 0
        @State var a_away_points : Int = 0
    }
    let ct = Count()

    // Functions
    
    //      Functions for Strikes
    public func strike() -> Void {
        ct.a_strikes += 1
        if (ct.a_strikes >= 3) {
            out()
        }
    }
    
    public func strike_min() -> Void {
        ct.a_strikes -= 1
        if (ct.a_strikes <= 0) {
            ct.a_strikes = 0
        }
    }
    //          End Function
    
    //      Function for Outs
    public func out() -> Void {
        ct.a_strikes = 0
        ct.a_balls = 0
        ct.a_outs += 1
        if (ct.a_outs >= 3) {
            ct.a_outs = 0
            if (ct.a_top_inning) {
                ct.a_top_inning = false
            }
            else {
                ct.a_top_inning = true
                ct.a_inning += 1
            }
        }
    }
    
    public func out_min() -> Void {
        ct.a_outs -= 1
        if (ct.a_outs <= 3) {
            ct.a_outs = 0
        }
    }
    //         End Function
    
    //      Function for balls
    public func ball() -> Void {
        ct.a_balls += 1
        if (ct.a_balls >= 4) {
            ct.a_balls = 0
            ct.a_strikes = 0
        }
    }
    
    public func ball_min() -> Void {
        ct.a_balls -= 1
        if (ct.a_balls <= 0) {
            ct.a_balls = 0
        }
    }
    
    //      Functions for innings
    public func inning_plus() -> Void {
        if (ct.a_top_inning == false) {
            ct.a_inning += 1
            ct.a_top_inning = true
        }
        else if (ct.a_top_inning == true) {
            ct.a_top_inning = false
        }
    }
    
    public func inning_min() -> Void {
        if (ct.a_top_inning == false) {
            ct.a_inning -= 1
            ct.a_top_inning = true
        }
        else {
            ct.a_top_inning = false
        }
        
        if (ct.a_inning <= 0) {
            ct.a_inning = 1
        }
    }
    
    //      Functions for Points
    public func home_pts_plus() -> Void {
        ct.a_home_points += 1
    }
    
    public func home_pts_min() -> Void {
        ct.a_home_points -= 1
        if (ct.a_home_points <= 0) {
            ct.a_home_points = 0
        }
    }
    
    public func away_pts_plus() -> Void {
        ct.a_away_points += 1
    }
    
    public func away_pts_min() -> Void {
        ct.a_away_points -= 1
        if (ct.a_away_points <= 0) {
            ct.a_away_points = 0
        }
    }
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
