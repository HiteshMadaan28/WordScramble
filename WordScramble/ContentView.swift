//
//  ContentView.swift
//  WordScramble
//
//  Created by Hitesh Madaan on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    var people=["Hello","This","is","goood"]
    var body: some View {
        List{
            Section("This is the main Section")
            {
                Text("Hello is this Hitesh")
            }
            Section("Dynamic Section")
            {
                ForEach(0..<3)
                {
                    Text("Hii \($0)")
                }
            }
        }
        List(people,id: \.self){
            
            Text("Hii \($0)")
                
            
        }
    }
    
    func testBundle(){
        if let fileURL=Bundle.main.url(forResource: "somefile", withExtension: "txt"){
            
        }
    }
}

#Preview {
    ContentView()
}
