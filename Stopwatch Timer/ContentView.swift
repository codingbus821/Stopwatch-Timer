//
//  ContentView.swift
//  Stopwatch Timer
//
//  Created by 김병수 on 2020/09/23.
//

import SwiftUI

struct LabelledDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color
    
    init(label: String, horizontalPadding: CGFloat = 0, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }
    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct Time: Identifiable {
    var id = UUID()
    var title : String
    var targetdate : String
    var targettime : String
    var color : Color
    
    init(title:String) {
        self.title = title
        targetdate = ""
        targettime = ""
        color = Color.blue
    }
}

struct ContentView: View {
    
    @State var timelist = [Time(title: "first"), Time(title: "second"), Time(title: "third")]
    
    var body: some View {
        VStack{
            HStack{
                MenuButton("􀣌") {
                    Button("로그인시 열기") { print("Create new contact") }
                    Button("도움말") { print("Create new group") }
                    Button("나가기") { print("Create new group") }
                }.padding(10).frame(width:80)
                
                Spacer()
                
                Button(action: {
                    addRow()
                }) {
                    Text("􀅼")
                }.padding(10)
            }
            
            LabelledDivider(label: "List")
            
            List{
                ForEach(timelist){ time in
                    HStack{
                        Rectangle().fill(time.color).frame(width: 50, height: 50, alignment: .center)
                        VStack(alignment:.leading){
                            Text(time.title).padding(4)
                            Text("hihi").padding(4)
                        }
                        Spacer()
                        Button("􀣌"){
                            
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            
            
        }.frame(width: 300, height: 350, alignment: .leading)
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            timelist.remove(at: first);
        }
    }
    
    func addRow() {
        print("add button pressed")
        timelist.append(Time(title:"무제"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
