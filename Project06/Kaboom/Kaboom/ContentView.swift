
//  Created by Sarfaroz on 2/11/22.
// IPHONE 11

import SwiftUI

enum BombState {
    case beingDefused, defused, exploded, gameLevel
}

// Addition
enum GameLevel {
    case hard, easy, medium
}

struct ContentView: View {
    @State var btn1Presses: Int = Int.random(in: 0...5)
    @State var btn1Pressed: Int = 0
    
    @State var btn2Presses: Int = Int.random(in: 0...5)
    @State var btn2Pressed: Int = 0
    
    @State var btn3Presses: Int = Int.random(in: 0...5)
    @State var btn3Pressed: Int = 0
    
    @State var isSecured = true
    
    @State var passwordGenerator = SecCreateSharedWebCredentialPassword() as String?
    
    @State var redWireConnected = Bool.random()
    @State var greenWireConnected = Bool.random()
    @State var blueWireConnected = Bool.random()
    
    @State var redWireNotConnected = false
    @State var greenWireNotConnected = false
    @State var blueWireNotConnected = false
    
    @State var codeWords = ""
    @State var password = ""
    
    @State var bombState = BombState.gameLevel
    @State var gameLevel = GameLevel.easy
    
    @State var words = ["white", "blue", "black", "green", "yellow", "violet", "gray"]
    @State var words2 = ["tiger", "lion", "snake", "bear", "wolf", "crocodile", "shark"]
    @State var randomNumberForWords = Int.random(in: 0...5)
    
    // restart the game
    func restart() {
        btn1Presses = Int.random(in: 0...5)
        btn1Pressed = 0
        
        btn2Presses = Int.random(in: 0...5)
        btn2Pressed = 0
        
        btn3Presses = Int.random(in: 0...5)
        btn3Pressed = 0
        
        redWireNotConnected = false
        greenWireNotConnected = false
        blueWireNotConnected = false
        
        redWireConnected = Bool.random()
        greenWireConnected = Bool.random()
        blueWireConnected = Bool.random()
        
        passwordGenerator = SecCreateSharedWebCredentialPassword() as String?
        isSecured = true
        
        randomNumberForWords = Int.random(in: 0...5)
        
        bombState = .beingDefused
        
        codeWords = ""
        password = ""
    }
    
    // generate instructions to complete based on chosen level
    func generateInstructions() -> String {
        var instructions: [String] = []
        
        if(btn1Presses > 0) {
            instructions.append("- Press 'Button 1' \(btn1Presses) \(btn1Presses == 1 ? "time" : "times")")
        }
        
        if(btn2Presses > 0) {
            instructions.append("Press 'Button 2' \(btn2Presses) \(btn2Presses == 1 ? "time" : "times")")
        }
        
        if(btn3Presses > 0) {
            instructions.append("Press 'Button 3' \(btn3Presses) \(btn3Presses == 1 ? "time" : "times")")
        }
        
        if gameLevel == GameLevel.medium {
            
            instructions.append("\n - Red wire should be \(redWireConnected == true ? "connected" : "disconnected")")
            instructions.append("Green wire should be \(greenWireConnected == true ? "connected" : "disconnected")")
            instructions.append("Blue wire should be \(blueWireConnected == true ? "connected" : "disconnected")")
        }
        
        if gameLevel == GameLevel.hard {
            
            instructions.append("\n - Red wire should be \(redWireConnected == true ? "connected" : "disconnected")")
            instructions.append("Green wire should be \(greenWireConnected == true ? "connected" : "disconnected")")
            instructions.append("Blue wire should be \(blueWireConnected == true ? "connected" : "disconnected")")
            
            instructions.append("\n - Enter the code words: \(words[randomNumberForWords]) \(words2[randomNumberForWords])")
            instructions.append("\n - Enter the password: \((passwordGenerator) ?? "qwerty")")
        }
        
        return instructions.joined(separator: ". ") + ". "
    }
    
    // check if defused properly
    func defuse() {
        if gameLevel == GameLevel.easy {
            if(btn1Presses == btn1Pressed && btn2Presses == btn2Pressed && btn3Presses == btn3Pressed) {
                bombState = .defused
            } else {
                bombState = .exploded
            }
        }
        
        
        if gameLevel == GameLevel.medium {
            if(btn1Presses == btn1Pressed && btn2Presses == btn2Pressed && btn3Presses == btn3Pressed) {
                bombState = .defused
            } else {
                bombState = .exploded
            }
            
            if redWireConnected == redWireNotConnected && greenWireConnected == greenWireNotConnected && blueWireConnected == blueWireNotConnected{
                bombState = .defused
            } else {
                bombState = .exploded
            }
        }
        
        
        if gameLevel == GameLevel.hard {
            if(btn1Presses == btn1Pressed && btn2Presses == btn2Pressed && btn3Presses == btn3Pressed) {
                bombState = .defused
            } else {
                bombState = .exploded
            }
            
            if(String(codeWords) == ("\(words[randomNumberForWords]) \(words2[randomNumberForWords])")) {
                bombState = .defused
            } else {
                bombState = .exploded
            }
            
            if redWireConnected == redWireNotConnected && greenWireConnected == greenWireNotConnected && blueWireConnected == blueWireNotConnected {
                bombState = .defused
            } else {
                bombState = .exploded
            }
            
            if(String(password) == ("\(passwordGenerator ?? "qwerty")")) {
                bombState = .defused
            } else {
                bombState = .exploded
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Kaboom!")
                .padding()
                .font(.system(size: 26, weight: .heavy, design: .rounded))
                .foregroundColor(Color.black)
            
            Form {
                switch bombState {
                case .beingDefused:
                    Text("Disarm the bomb by following the instructions:")
                        .font(.system(size: 20, weight: .medium))
                        .padding()
                    
                    Text(generateInstructions())
                        .padding()
                    
                    HStack(spacing: 20) {
                        Spacer()
                        Button("1") {
                            btn1Pressed+=1
                        }.buttonStyle(.borderedProminent)
                            .cornerRadius(10)
                            .controlSize(.large)
                        
                        Button("2") {
                            btn2Pressed+=1
                        }.buttonStyle(.borderedProminent)
                            .cornerRadius(10)
                            .controlSize(.large)
                        
                        Button("3") {
                            btn3Pressed+=1
                        }.buttonStyle(.borderedProminent)
                            .cornerRadius(10)
                            .controlSize(.large)
                        Spacer()
                    }
                    
                    TextField("Code", text: $codeWords)
                        .foregroundColor(Color.black)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                    
                    Toggle(isOn: $redWireNotConnected) {
                        Text("Red Wire Connected").foregroundColor(Color.red)
                            .bold()
                    }
                    .toggleStyle(CheckmarkToggleStyle())
                    
                    Toggle(isOn: $greenWireNotConnected) {
                        Text("Green Wire Connected").foregroundColor(Color.green)
                            .bold()
                    }
                    .toggleStyle(CheckmarkToggleStyle())
                    
                    Toggle(isOn: $blueWireNotConnected) {
                        Text("Blue Wire Connected").foregroundColor(Color.blue)
                            .bold()
                    }
                    .toggleStyle(CheckmarkToggleStyle())
                    
                    ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("Password", text: $password)
                                    .disableAutocorrection(true)
                                    .textInputAutocapitalization(.never)
                                
                            } else {
                                TextField("Password", text: $password)
                                    .textInputAutocapitalization(.never)
                            }
                        }.padding(.trailing, 32)
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
                    
                case .defused:
                    Image("vectorImage").resizable().aspectRatio(contentMode: .fit).foregroundColor(.green)
                    
                    Text("Well Done! The bomb was successfully defused!")
                        .font(.system(size: 20, weight: .heavy, design:.monospaced))
                        .frame(alignment: .center)
                case .exploded:
                    Image("bomb").resizable().aspectRatio(contentMode: .fit)
                    
                    Text("Babaaah!!! The bomb was not defused properly!")
                        .font(.system(size: 20, weight: .heavy, design:.monospaced))
                        .frame(alignment: .center)
                case .gameLevel:
                    Text("Choose the level of the game:")
                        .font(.system(size: 26, weight: .heavy, design:.monospaced))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    HStack() {
                        Button("Easy") { bombState = .beingDefused
                            gameLevel = .easy
                        }
                        .buttonStyle(GrowingButton())
                        .padding()
                        .fixedSize()
                        
                        Button("Medium") { bombState = .beingDefused
                            gameLevel = .medium
                        }
                        .buttonStyle(GrowingButton())
                        .padding()
                        .fixedSize()
                        
                        Button("Hard") { bombState = .beingDefused
                            gameLevel = .hard
                        }
                        .buttonStyle(GrowingButton())
                        .padding()
                        .fixedSize()
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("*Instructions:")
                            .foregroundColor(.red)
                        Text("EASY - at most one intruction to defuse the bomb")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                        
                        Text("MEDIUM - at most two intructions to defuse bomb")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.leading)
                        
                        Text("HARD - at most four intructions to defuse the bomb")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.leading)
                    }
                }
                
                if bombState != .gameLevel {
                    HStack(spacing: 20) {
                        Spacer()
                        if(bombState == .beingDefused) {
                            Button("Defuse", role: .destructive) {defuse()
                            }
                            .buttonStyle(.borderedProminent)
                            .fixedSize()
                            .cornerRadius(20)
                            
                            Button("Levels"){ bombState = .gameLevel
                            }
                            .buttonStyle(.borderedProminent)
                            .fixedSize()
                            .cornerRadius(20)
                        }
                        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

// Button Style  (1st screen)
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.3 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

// Toggle Style
struct CheckmarkToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? .green : .gray)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.black))
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(configuration.isOn ? .green : .gray)
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                    
                ).cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
