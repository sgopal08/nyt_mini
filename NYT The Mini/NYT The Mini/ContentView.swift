//
//  ContentView.swift
//  TheMini
//
//  Created by Sanjana G on 4/4/24.
//

import SwiftUI


struct ContentView: View {
    @State private var elapsedTime = 0
    @State private var showSettings: Bool = false
    @State private var showInfo: Bool = false
    @State private var currentClue: String?
    @State private var listPress = false
    @State private var pencilPress = false
    @State private var lifePress = false



    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func formatTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%2d:%02d", minutes, seconds)
    }

    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Image(systemName: "chevron.down")
                        .font(.title)
                        .foregroundColor(Color("periwinkle"))
                        .bold()
                    Spacer()
                    Text("\(formatTime(elapsedTime))")
                               .foregroundColor(.black)
                               .onReceive(timer) { _ in
                                   self.elapsedTime += 1
                               }
                    Spacer()
                    Button(action: {
                               self.listPress.toggle()
                           }) {
                               Image(systemName: "list.dash")
                                   .font(.title)
                                   .foregroundColor(listPress ? .white : Color("periwinkle"))
                                   .padding(4)
                                   .background(listPress ? Color("periwinkle") : nil)
                                   .cornerRadius(10)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                           .stroke(Color.blue, lineWidth: listPress ? 1 : 0)
                                   )
                                   .padding(2)
                           }

                    Button(action: {
                               self.pencilPress.toggle()
                           }) {
                               Image(systemName: "pencil")
                                   .font(.title)
                                   .foregroundColor(pencilPress ? .white : Color("periwinkle"))
                                   .padding(4)
                                   .background(pencilPress ? Color("periwinkle") : nil)
                                   .cornerRadius(10)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                           .stroke(Color.blue, lineWidth: pencilPress ? 1 : 0)
                                   )
                                   .padding(2)
                           }

                    Button(action: {
                               self.lifePress.toggle()
                           }) {
                               Image(systemName: "lifepreserver")
                                   .font(.title)
                                   .foregroundColor(lifePress ? .white : Color("periwinkle"))
                                   .padding(4)
                                   .background(lifePress ? Color("periwinkle") : nil)
                                   .cornerRadius(10)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                           .stroke(Color.blue, lineWidth: lifePress ? 1 : 0)
                                   )
                                   .padding(2)
                           }
                    Button(action:  {
                        showInfo = true
                    }) {
                        Image(systemName: "info")
                            .font(.title)
                            .foregroundColor(Color("periwinkle"))
                            .bold()
                    }
                    .padding(2)
            
                    Button(action:  {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                            .foregroundColor(Color("periwinkle"))
                            .bold()
                    }
                    .padding(2)
                }
                .padding(.bottom, 1)
                
                CrosswordView()
                .padding(.bottom, 25)
                                
                Spacer()
                
            }
            .padding()
            .background(Color.white)
            .sheet(isPresented: $showSettings){
                        PuzzleSettingsView()
                    }
            .sheet(isPresented: $showInfo){
                InfoView()
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
