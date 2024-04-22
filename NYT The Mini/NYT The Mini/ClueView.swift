
//  ClueView.swift
//  NYT The Mini
//
//  Created by Sanjana G on 4/19/24.
//

import SwiftUI

// ClueView.swift

struct ClueView: View {
    @Binding var currentClue: String?
    @State private var index = 0
    
    let clues = ["Bluegrass instrument", "Audible way to think", "Aladdin character whose first line is \"Oy! 10,000 years will give you such a crick in the neck!\"", "Members of a company's C-suite", "Behind schedule", "Clue 1", "Clue 2", "Clue 3", "Clue 4", "Clue 5"]
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("lightBlue"))
                    .frame(width: 400, height: 60)
                HStack{
                    Button(action: {
                          index -= 1
                          if index < 0 {
                              index = clues.count - 1
                          }
                      }) {
                          Image(systemName: "chevron.left")
                              .foregroundColor(.black)
                        
                      }
                      .padding()
                    
                    if let currentClue = currentClue {
                        Text(currentClue)
                            .padding()
                    } else {
                        Text(clues[index])
                            .padding()
                            .font(.callout)
                    }
                    Spacer()
                    Button(action: {
                           index += 1
                           if index >= clues.count {
                               index = 0
                           }
                       }) {
                           Image(systemName: "chevron.right")
                               .foregroundColor(.black)
                       }                }
                .padding()
                
                
            }
        }
    }
}

//#Preview {
//    ClueView(currentClue: $currentClue)
//}
