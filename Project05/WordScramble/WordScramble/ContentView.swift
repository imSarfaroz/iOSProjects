//
//  ContentView.swift
//  WordScramble
//
//  Created by Sarfaroz on 4/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorText = ""
    @State private var showingError = false
    
    @State private var score:Int = 0
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle.fill")
                                Text(word)
                            }
                        }
                    }
                    Text("Score: \(score)")
                }
                .navigationTitle(rootWord)
                .onSubmit {
                    addNewWord()
                }
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(errorText)
                }
                .toolbar {
                    Button("Restart") {
                        startGame()
                    }
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more creative!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "word not possible", message: "it is impossible spelling that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "not a word!", message: "you cant just to make out a word :/")
            return
        }
        
        guard longEnough(word: answer) else {
            wordError(title: "the word not long enough!", message: "it must be longer than two letters!")
            return
        }
        score+=answer.count
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsUrl) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = [String]()
                score = 0
                return
            }
        }
        fatalError("Could not load start.txt. The file might be corrupted")
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
    
    func longEnough(word: String) -> Bool {
        if word.count < 3 {
            return false
        }
        return true
    }
    
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorText = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
