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
        // components(separatedBy:) separate our string using an input value
        let letters=input.components(separatedBy: "\n")
        let letter=letters.randomElement()
        let trimmed=letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "Swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
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
