//
//  ContentView.swift
//  TSI Example
//
//  Created by Sandra K Cureton on 6/24/22.
//  copying to GitHub
import Foundation
import SwiftUI

class ReDraw:ObservableObject {
    @Published var newRowData:Bool
    @Published var newRowSelected:Bool
    init(){
        self.newRowData = false
        self.newRowSelected = false
    }
    func toggleBid(){
        self.newRowData = !self.newRowData
    }
    func toggleTable(){
        self.newRowSelected = !self.newRowData
    }
    func printNew() {
        print(self.newRowData.description)
    }
}

// =============================================
struct ContentView: View {
     var data1 = [1,2,3]
     @State var data2 = ["A", "B", "C", "D"]
     @State var data3 = ["1", "2", "3", "4"]
     @State var data2a = "X"
     @State var data3a = "Y"
     @ObservedObject var reDraw = ReDraw()
    var body: some View {
        Text("First View")
            .padding()
        NavigationView {
        List {
            ForEach(data1, id:\.self) { t  in
            //    let mydata = getData(t:t)
                HStack {
                  //  Text(mydata).hidden()
                 //   Text(reDraw.newRowData.description).hidden()
                    Text("Row")
                    Text(t.description)
                    Text(data2[t-1])
                    Text(data3[t-1])
                   
                  //  Text(data2a).hidden()
                 //   Text(data3a).hidden()
                    
                    NavigationLink(
                        destination:  View2(t:t, data2Array: $data2, data3Array: $data3, data2: $data2a, data3: $data3a,  reDraw: reDraw),
                         label: { }
                     )  // end Nav Link
                    }
        }//End For Each
     } // End List
    } // End Nav View
  }// End body
    func getData(t: Int) -> String {
      data2a = data2[t]
      data3a = data3[t]
        return data2a
    }
}

//===================================================================

struct View2: View {
    var t: Int
    @Binding var data2Array: [String]
    @Binding var data3Array: [String]
    @Binding var data2: String
    @Binding var data3: String
    @ObservedObject var reDraw: ReDraw
    
    var body: some View {
        Text("Second View")
            .padding()
        List {
            HStack {
                Text(t.description)
                Text(data2)
                Text(data3)
                    }
            VStack {
                HStack {
                         Text("data 2a")
                Picker(selection: $data2, label: Text("data2"))  {
                     //    Text("P").tag(String(0))
                         Text("A").tag(String("A"))
                         Text("B").tag(String("B"))
                         Text("C").tag(String("C"))
                         Text("D").tag(String("D"))
                         Text("E").tag(String("E"))
                         Text("F").tag(String("F"))
                         Text("G").tag(String("G"))
                     }.pickerStyle(SegmentedPickerStyle())
                    HStack {
                             Text("data3a")
                    Picker(selection: $data3, label: Text("data3"))  {
                         //    Text("P").tag(String(0))
                             Text("1").tag(String(1))
                             Text("2").tag(String(2))
                             Text("3").tag(String(3))
                             Text("4").tag(String(4))
                             Text("5").tag(String(5))
                             Text("6").tag(String(6))
                             Text("7").tag(String(7))
                         }.pickerStyle(SegmentedPickerStyle())
                         .font(Font.custom("Avenir Black", size: 30))
                    }
                    Button("Done") {
                        data2Array[t-1] = data2
                        data3Array[t-1] = data3
                        reDraw.toggleBid()
                            }
                }
            }
        }//End For Each
     } // End List
    
    }

