//
//  TourniquetView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 24/03/2024.
//

import SwiftUI

struct TourniquetView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("TOURNIQUET")
                .bold()
            Text("Ensure tourniquet\nis applied less\nthan 1 min")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            Text("Apply the\ntourniquet")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            Text("Clean the site")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            Text("Puncture (bevel\nup, 5-30 degree\nangle")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            NavigationStack {
                Button(action: {
                    isPresented = true
                }) {
                    Text("START")
                }
                .background(Color.red)
                .cornerRadius(10)
                .navigationDestination(isPresented: $isPresented) {
                    Text("Details screen")
                }
            }
        }
    }
}

struct TourniquetView_Previews: PreviewProvider {
    static var previews: some View {
        TourniquetView()
    }
}
