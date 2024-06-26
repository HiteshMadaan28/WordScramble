//
//  ContentView.swift
//  WordScramble
//
//  Created by Hitesh Madaan on 16/04/24.
/*
 LinearGradient(colors: [.blue , .pink], startPoint: .top, endPoint: .bottom)
     .ignoresSafeArea()
 */
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var Wcount = 0
    @State private var Lcount = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var people=["Hello","This","is","goood"]
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: [.white , .cyan], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    List{
                        Section{
                            TextField("Enter your word", text: $newWord)
                                .textInputAutocapitalization(.never)
                        }
                        
                        Section{
                            ForEach(usedWords, id: \.self) { word in
                                Text(word)
                            
                            }
                        }
                        
                    }
                    
                    VStack{
                        Text("Word Count : \(Wcount) , Letter Count : \(Lcount) ")
                    }
                
                }
                .padding(10)
                .frame(width: 320,height: 500)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                
                
            }
            .toolbar{
                Button("Start Game")
                {
                    startGame()
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
            } message: {
                Text(errorMessage)
            }
            
        }
        
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 3 else {
            wordError(title: "Word is Too Short", message: "Think more")
            return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        updateValues(answer)
        Wcount += 1
        usedWords.insert(answer, at: 0)
        
        newWord = ""
    }
    
    func updateValues(_ word:String){
        for i in word{
            Lcount += 1
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
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
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
