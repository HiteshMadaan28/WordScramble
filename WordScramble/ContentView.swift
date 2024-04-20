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
    
    func testString(){
        let input="""
        a
        b
        c
        """
        let letters=input.components(separatedBy: "\n")
        let letter=letters.randomElement()
    }
    
    func testBundle(){
        if let fileURL=Bundle.main.url(forResource: "somefile", withExtension: "txt"){
            //Bundle
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
        
    }
}

#Preview {
    ContentView()
}
