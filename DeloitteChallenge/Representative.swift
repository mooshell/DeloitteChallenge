//
//  Representative.swift
//  DeloitteChallenge
//
//  Created by Michelle Elias Flores on 1/5/25.
//
import SwiftUI

struct Representative: View {
    @State private var zipCode = ""  // zipcode input
    @State private var errorMessage = "" // Error message state
    @FocusState private var isZipCodeFieldFocused: Bool  // For dismissing the keyboard

    var body: some View {
        ZStack {
            Color(red: 239/255, green: 232/255, blue: 253/255)
            .ignoresSafeArea()
            VStack {
                Text("You can take action by finding out who represents you in congress and ask them to vote for bills to combat climate change!")
                    .font(.headline)
                    .fontDesign(.serif)
                
                // TextField for ZIP code input
                TextField("Enter ZIP Code", text: $zipCode)
                    .padding()
                    .keyboardType(.numberPad) //number keyboard
                    .focused($isZipCodeFieldFocused)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .fontDesign(.serif)
                
                let notNum = Double(zipCode) == nil // check if input isnt a number
                
                if (zipCode.count == 0 ) {
                    Text("")
                    // so it doesnt display anything when blank
                } else if (notNum || zipCode.count > 5 || zipCode.count < 5) {
                    // if its not a valid input
                Text("Please Only Input a Valid Zipcode")
                    .fontDesign(.serif)
                }
                else {
                    //trigger button to find rep
                    Link("Find my Representative!", destination: URL(string: "https://whoismyrepresentative.com/search/zip/\(zipCode)")!)
                        .foregroundStyle(.white)
                        .padding()
                        .fontDesign(.serif)
                        .background(Color(red: 215/255, green: 204/255, blue: 245/255))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }
            } // end of VStack
            .padding()
            // Dismiss keyboard when tapping outside
            .onTapGesture {
                isZipCodeFieldFocused = false
            }
            .onAppear {
                // Ensure the keyboard shows when the view appears
                DispatchQueue.main.async {
                    isZipCodeFieldFocused = true
                }
            }
        } //end of ZStack
        
    }
}

#Preview {
    Representative()
}
