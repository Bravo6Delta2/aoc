import Foundation

var text = """
3   4
4   3
2   5
1   3
3   9
3   3
"""

do {
    text = try String(contentsOfFile: "input.txt", encoding: .utf8)
} catch {
    print("Error reading contents: \(error.localizedDescription)")
}

let dd = text.components(separatedBy: "\n")
let dl = dd.map { $0.components(separatedBy: "   ") }.map { Int($0[0])! }.sorted { $0 > $1 }
let dr = dd.map { $0.components(separatedBy: "   ") }.map { Int($0[1])! }.sorted { $0 > $1 }

var cnt = 0 

for el in dl {
    cnt += dr.reduce(0) { $0 + ($1 == el ? $1 : 0)}
}

print(cnt)
