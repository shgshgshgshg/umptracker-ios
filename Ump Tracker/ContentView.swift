//
//  ContentView.swift
//  Ump Tracker
//
//  Created by Simon Gil on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    // Variables
    let ut = Ump_TrackerApp.Count()
    @State var strikes : Int = 0
    @State var balls : Int = 0
    @State var outs : Int = 0
    @State var inning : Int = 1
    @State var top_inning : Bool = true
    @State var HOME_TEAM : String = ""
    @State var AWAY_TEAM : String = ""
    @State var home_points : Int = 0
    @State var away_points : Int = 0
    let umptracker = Ump_TrackerApp()
    
    // Functions
    
    //      Functions for Strikes
    func strike() -> Void {
        strikes += 1
        if (strikes >= 3) {
            out()
        }
    }
    
    func strike_min() -> Void {
        strikes -= 1
        if (strikes <= 0) {
            strikes = 0
        }
    }
    //          End Function
    
    //      Function for Outs
    func out() -> Void {
        strikes = 0
        balls = 0
        outs += 1
        if (outs >= 3) {
            outs = 0
            if (top_inning) {
                top_inning = false
            }
            else {
                top_inning = true
                inning += 1
            }
        }
    }
    
    func out_min() -> Void {
        outs -= 1
        if (outs <= 3) {
            outs = 0
        }
    }
    //         End Function
    
    //      Function for balls
    func ball() -> Void {
        balls += 1
        if (balls >= 4) {
            balls = 0
            strikes = 0
        }
    }
    
    func ball_min() -> Void {
        balls -= 1
        if (balls <= 0) {
            balls = 0
        }
    }
    
    //      Functions for innings
    func inning_plus() -> Void {
        if (top_inning == false) {
            inning += 1
            top_inning = true
        }
        else if (top_inning == true) {
            top_inning = false
        }
    }
    
    func inning_min() -> Void {
        if (top_inning == false) {
            inning -= 1
            top_inning = true
        }
        else {
            top_inning = false
        }
        
        if (inning <= 0) {
            inning = 1
        }
    }
    
    func inning_reset() -> Void {
        inning = 1
        top_inning = true
    }
    
    //      Functions for Points
    func home_pts_plus() -> Void {
        home_points += 1
    }
    
    func home_pts_min() -> Void {
        home_points -= 1
        if (home_points <= 0) {
            home_points = 0
        }
    }
    
    func away_pts_plus() -> Void {
        away_points += 1
    }
    
    func away_pts_min() -> Void {
        away_points -= 1
        if (away_points <= 0) {
            away_points = 0
        }
    }
    
  //View
    
    var body: some View {
        VStack (alignment: .leading) { //VStack for inning
            Button(action: {
                inning_reset()
            }) {
                Text("Reset Innings")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            Text("Inning: \(inning)")
                .font(.title2)
                .fontWeight(.bold)
            Text("Top of Inning: \(String(top_inning))")
                .font(.title2)
                .fontWeight(.bold)
            Button(action: {
                inning_plus()
            }) {
                Text("Inning +")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            Button(action: {
                inning_min()
            }) {
                Text("Inning -")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
            }
            Text("")
                .font(.title)
        }
        Divider()
        VStack { //VStack for strikes
            HStack { //Button HStack
                Button(action: {
                    strike()
                }) {
                    Text("Strike +")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                Text("|")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {
                    strike_min()
                }) {
                    Text("Strike -")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            Text("\(strikes)")
                .font(.title)
                .fontWeight(.bold)
        }
        VStack { //VStack for balls
            HStack { //Button HStack
                Button(action: {
                    ball()
                }) {
                    Text("Ball +")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                Text("|")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {
                    ball_min()
                }) {
                    Text("Ball -")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            Text("\(balls)")
                .font(.title)
                .fontWeight(.bold)
        }
        VStack { //VStack for outs
            HStack { //HStack for outs
                Button(action: {
                    out()
                }) {
                    Text("Out +")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                Text("|")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {
                    out_min()
                }) {
                    Text("Out -")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            Text("\(outs)")
                .font(.title)
                .fontWeight(.bold)
        }
        Divider()
        HStack { //Horizontal stack for points
            VStack { //Vertical stack for away team points
                Text("Away: \(away_points)")
                    .font(.title)
                    .fontWeight(.bold)
                //Start button
                Button(action: {
                    away_pts_plus()
                }) {
                    Text("Away +")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                //End Button
                //Start Button
                Button(action: {
                    away_pts_min()
                }) {
                    Text("Away -")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                //End Button
            }
            Divider()
                .frame(height: 120)
            VStack { //Vertical stack for home team points
                Text("Home: \(home_points)")
                    .font(.title)
                    .fontWeight(.bold)
                //Start button
                Button(action: {
                    home_pts_plus()
                }) {
                    Text("Home +")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                //End Button
                //Start Button
                Button(action: {
                    home_pts_min()
                }) {
                    Text("Home -")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                //End Button
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
