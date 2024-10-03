import SwiftUI

struct CrosswordView: View {
    @State private var tappedCells: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    @State private var currentText = ""
    @State private var texts: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)
    @State private var selectedCell: (row: Int, column: Int)? = nil
    @State private var currentClue: String?
    @State private var index = 0
    @State private var isEditing: Bool = true
    @State private var pencilPressed: Bool = false

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                ForEach(0..<5) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<5) { column in
                            let isLastCell = row == 4 && column == 4
                            ZStack {
                                TextField("", text: $texts[row][column])
                                    .font(.system(size: 50))
                                    .frame(width: 77, height: 77)
                                    .border(Color.gray, width: 1)
                                    .background(selectedCell != nil && selectedCell!.row == row && selectedCell!.column == column ? Color.yellow : Color.white)
                                    .foregroundColor(pencilPressed ? Color.gray : Color.black)
                                    .multilineTextAlignment(.center)
                                    .autocorrectionDisabled(true)
                                    .onTapGesture {
//                                        self.isEditing = true
                                        selectedCell = (row,column)
                                        if tappedCells[row][column] < 2 {
                                            tappedCells[row][column] += 1
                                        } else {
                                            tappedCells[row][column] = 0
                                        }
                                        updateText(row: row, column: column)
                                    }
                                    .onSubmit{
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                
                                if row == 0 && column == 0 {
                                    Text("1")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding(4)
                                        .multilineTextAlignment(.trailing)
                                } else if column == 0 && row != 0 {
                                    Text("\(row + 1)")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding(4)
                                        .alignmentGuide(.top) { $0[.top] }
                                        .alignmentGuide(.leading) { $0[.leading] }
                                } else if row == 0 && column != 0 {
                                    Text("\(column + 1)")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding(4)
                                        .alignmentGuide(.top) { $0[.top] }
                                        .alignmentGuide(.leading) { $0[.leading] }
                                } else if isLastCell {
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width: 77, height: 77)
                                }
                            }
                            
                        }
                    }
                }
        
                
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
                        
                        
                        Text(currentText)
                            .font(.callout)
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
                .onAppear {
                       pencilPressed = false
                   }
    
            }
            
        }
        Spacer()
        
    }
    
    let clues = ["Bluegrass instrument", "Audible way to think", "Aladdin character whose first line is \"Oy! 10,000 years will give you such a crick in the neck!\"", "Members of a company's C-suite", "Behind schedule", "Clue 1", "Clue 2", "Clue 3", "Clue 4", "Clue 5"]

    
    private func updateText(row: Int, column: Int) {
            if tappedCells[row][column] == 1 {
                switch row {
                case 0:
                    currentText = "Across: Bluegrass instrument"
                case 1:
                    currentText = "Across: Audible way to think"
                case 2:
                    currentText = "Across: Aladdin character whose first line is \"Oy! 10,000 years will give you such a crick in the neck!\""
                case 3:
                    currentText = "Across: Members of a company's C-suite"
                case 4:
                    currentText = "Across: Behind schedule"
                default:
                    break
                }
                
            } else if tappedCells[row][column] == 2 {
                switch column {
                case 0:
                    currentText = "Down: The schmear goes here"
                case 1:
                    currentText = "Down: Amazon's assistant"
                case 2:
                    currentText = "Down: Group of nine"
                case 3:
                    currentText = "Down: Battery life, informally"
                case 4:
                    currentText = "Down: Poems like \"To Autumn\" and \"To a Skylark\""
                default:
                    break
                }
            } else {
                switch row {
                case 0:
                    currentText = "Across: Bluegrass instrument"
                case 1:
                    currentText = "Across: Audible way to think"
                case 2:
                    currentText = "Across: Aladdin character whose first line is \"Oy! 10,000 years will give you such a crick in the neck!\""
                case 3:
                    currentText = "Across: Members of a company's C-suite"
                case 4:
                    currentText = "Across: Behind schedule"
                default:
                    break
                }
            }
        }
    }

#Preview{
    CrosswordView()
}

