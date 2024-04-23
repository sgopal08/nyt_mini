//
//  StartScreen.swift
//  NYT The Mini
//
//  Created by Sanjana G on 4/22/24.
//

import SwiftUI

struct StartScreen: View {
    
    @State private var showStartScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode

    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()

    var body: some View {
        NavigationView {
            ZStack {
                Color("lightBlue")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("The Mini Crossword")
                        .font(.largeTitle)
                        .bold()
                    Text("Ready to start solving?")
                        .font(.title)
                        .padding(.bottom, 25)
                    NavigationLink(destination: ContentView()) {
                        Text("Begin")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color.black)
                            .cornerRadius(30)

                    }
                    .padding(.bottom, 25)
                    .navigationBarHidden(true)
                    Text("Want to save your progress?")
                        .font(.headline)
                    
                    Button(action: {
                    }) {
                        Text("Log in")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 150, height: 50)
                    }
                    .background(Color("lightBlue"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                    Button(action: {
                    }) {
                        Text("Create account")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 150, height: 50)
                    }
                    .background(Color("lightBlue"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                    
                    Text(Date(), formatter: dateFormatter)
                        .font(.headline)
                        .padding(.top, 20)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Text("By Sanjana Gopalswamy")
                    

                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartScreen()
}
