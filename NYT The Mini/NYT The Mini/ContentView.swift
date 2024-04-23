//
//  ContentView.swift
//  TheMini
//
//  Created by Sanjana G on 4/4/24.
//

import SwiftUI


struct ContentView: View {

    @State private var currentClue: String?

    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                NavBar()
                
                Spacer()
                
                CrosswordView()
                .padding(.bottom, 25)
                                
                Spacer()
                
            }
            .padding()
            .background(Color.white)
            .navigationBarHidden(true)
            
            Spacer()

        }
        .navigationBarBackButtonHidden(true)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
