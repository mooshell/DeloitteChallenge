//
//  ContentView.swift
//  DeloitteChallenge
//
//  Created by Michelle Elias Flores on 1/4/25.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 215/255, green: 204/255, blue: 245/255)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Welcome to my app!")
                        .fontDesign(.serif)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) { 
                    NavigationLink(destination: Representative()) {
                        Text("Reps")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

