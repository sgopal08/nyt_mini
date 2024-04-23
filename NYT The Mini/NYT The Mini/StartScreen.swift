//
//  StartScreen.swift
//  NYT The Mini
//
//  Created by Sanjana G on 4/22/24.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("periwinkle")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    //star image icon here
                    Text("The Mini Crossword")
                        .font(.title)
                        .bold()
                    Text("Ready to start solving?")
                        .font(.headline)
                        .padding(.bottom, 30)
                    NavigationLink(destination: ContentView()) {
                        Text("Begin")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color.black)
                            .cornerRadius(30)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    StartScreen()
}
