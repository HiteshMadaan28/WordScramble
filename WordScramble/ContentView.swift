//
//  ContentView.swift
//  WordScramble
//
//  Created by Hitesh Madaan on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var people=["Hello","This","is","goood"]
    var body: some View {
        NavigationStack {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }

                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            Text(word)
                        }
                    }
                }
                .navigationTitle(rootWord)
                .onSubmit(addNewWord)
                
            }
    }
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come

        usedWords.insert(answer, at: 0)
        newWord = ""
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
