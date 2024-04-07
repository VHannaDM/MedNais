//
//  ParametersView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 01/04/2024.
//

import SwiftUI

struct ParametersView: View {
    @State private var showExplication: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                saveCloseButton
                sendEmailButton
            }
        }
    }
    
    var saveCloseButton: some View {
        Button {
            showExplication = true
        } label: {
            Text("SAVE&CLOSE")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var sendEmailButton: some View {
        Button {
            showExplication = true
        } label: {
            Text("SEND TO EMAIL")
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct ParametersView_Previews: PreviewProvider {
    static var previews: some View {
        ParametersView()
    }
}
