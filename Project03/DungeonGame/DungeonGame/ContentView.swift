import SwiftUI

class Dungeon {
    // State
    typealias Room = Character
    
    let map: [[Room]]
    
    // Behavior
    
    var width: Int {
        map[0].count
    }
    
    var height: Int {
        map.count
    }
    
    var doorCoors: (x: Int, y: Int)
    var treasureCoors: (x: Int, y: Int)
    
    
    convenience init() {
        self.init(withMap: [
            ["#", "#", "#", "#", "#", "#"],
            ["#", "@", " ", " ", " ", "#"],
            ["#", "#", "#", "#", " ", "#"],
            ["#", " ", " ", " ", " ", "#"],
            ["#", " ", "#", "#", "#", "#"],
            ["#", " ", " ", " ", "$", "#"],
            ["#", "#", "#", "#", "#", "#"]
        ])
    }
    
    init(withMap map: [[Room]]) {
        self.map = map
        
        doorCoors = (x: -1, y: -1)
        treasureCoors = (x: -1, y: -1)
        for(y, row) in map.enumerated() {
            for(x, room) in row.enumerated() {
                if room == "@" {
                    doorCoors = (x, y)
                } else if room == "$" {
                    treasureCoors = (x, y)
                }
            }
        }
    }
    
    subscript(coords: (x: Int, y: Int)) -> Room {
        return map[coords.y][coords.x]
    }
    
    func areCoordsInside(coords: (x: Int, y: Int)) -> Bool {
        return (0..<width).contains(coords.x) && (0..<height).contains(coords.y)
    }
}

struct Player {
    // State
    var coords: (x: Int, y: Int)
    var direction = (dx: 1, dy: 0)
    
    let dungeon: Dungeon
    
    var canMoveForward: Bool {
        let nextCoords = (x: coords.x + direction.dx, y: coords.y + direction.dy)
        
        return (dungeon.areCoordsInside(coords: nextCoords) && dungeon[nextCoords] != "#")
    }
    
    var treasureFound: Bool {
        return dungeon[coords] == "$"
    }
    // Behavior
    
    init(dungeon: Dungeon) {
        self.dungeon = dungeon
        coords = dungeon.doorCoors
    }
    
    // A lot of to do stuff :))
    
    func turnRight() -> Player {
        var playerCopy = self
        playerCopy.direction = (dx:-direction.dy, dy:direction.dx)
     
        return playerCopy
    }
    
    func turnLeft() -> Player{
        var playerCopy = self
        playerCopy.direction = (dx: direction.dy, dy: -direction.dx)
     
        return playerCopy
    }
    
    func move() -> Player{
        var playerCopy = self
        
        if canMoveForward {
            playerCopy.coords = (x: coords.x + direction.dx, y: coords.y + direction.dy)
        }
     
        return playerCopy
    }
    
    func description() -> String {
        var desk = ""
        
        for(y, row) in dungeon.map.enumerated() {
            for(x, room) in row.enumerated() {
                if(coords == (x, y)) {
                    switch(direction){
                        case(-1, 0): desk += "←"
                        case(0, -1): desk += "↑"
                        case(1, 0): desk += "→"
                        case(0, 1): desk += "↓"
                    default: break
                    }
                } else {
                    desk += String(room)
                }
            }
            desk += "\n"
        }
        return desk
    }
}

struct DungeonView: View {
    let player: Player
    
    var body: some View {
        if player.treasureFound {
            let treasureFont = Font.system(size: 200)
            
            Text("💰").font(treasureFont)
                .padding()
            
        } else {
            VStack {
                let dungeonFont = Font.system(size: 50, weight: .thin).monospaced()
                let linkFont = Font.system(size: 20)
                
                Text(player.description()).font(dungeonFont)
                    .foregroundColor(.red)
                    .padding()
                
                HStack {
                    NavigationLink(destination: DungeonView(player: player.turnLeft())) {
                        Text("turn LEFT").font(linkFont)
                    }
                    if player.canMoveForward {
                        NavigationLink(destination: DungeonView(player: player.move())) {
                            Text("Forward").font(linkFont).bold()
                        }
                    }
                    NavigationLink(destination: DungeonView(player: player.turnRight())) {
                        Text("turn RIGHT").font(linkFont)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    let player = Player(dungeon: Dungeon())
    
    var body: some View {
        NavigationView {
            DungeonView(player: player)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

