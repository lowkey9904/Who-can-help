//
//  ContentView.swift
//  Who can help
//
//  Created by Joker on 2020/4/25.
//  Copyright © 2020 ntoucs. All rights reserved.
//

import SwiftUI

struct list{
    var Img:String
    var Name:String
    var Info:String
}

struct ContentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 1/255, green: 153/255, blue: 220/255, alpha: 0.3)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 1/255, green: 153/255, blue: 220/255, alpha: 1)], for: .normal)
    }
    
    let Capoo: [list] = [
        list(Img: "happy", Name: "開心", Info: "咖波很開心"),
        list(Img: "angry", Name: "怒怒", Info: "咖波怒怒！"),
        list(Img: "love", Name: "最愛你了", Info: "咖波最愛你了！"),
        list(Img: "nothing", Name: "淡定", Info: "咖波對你沒有感覺")
    ]
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack{
            Button(action:{
                let randIndex = 0 ..< self.Capoo.count
                self.selectedIndex = randIndex.randomElement()!
            }){
                Image(systemName: "questionmark.square")
                .resizable()
                .frame(width:60, height: 60)
                .foregroundColor(Color(red: 1/255, green: 153/255, blue: 220/255))
            }
            Picker(selection: $selectedIndex, label: Text("capooselect")) {
                ForEach(0..<Capoo.count) { (index) in
                    Text(self.Capoo[index].Name).tag(index)
                    
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color(red: 247/255, green: 247/255, blue: 239/255))
            .cornerRadius(8)
            .shadow(radius: 30)
            .padding()
            Text("\(Capoo[selectedIndex].Info)")
            .foregroundColor(Color(red: 1/255, green: 153/255, blue: 220/255))
            .font(.system(size: 20))
            Image("\(Capoo[selectedIndex].Img)")
                .offset(x:-50, y:50)
                .shadow(radius: 15)
            
        }.offset(y:130)
            .background(
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width:420)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
