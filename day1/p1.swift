import Foundation

var text = ""

do {
    text = try String(contentsOfFile: "input.txt", encoding: .utf8)
} catch {
    print("Error reading contents: \(error.localizedDescription)")
}

let dd = text.components(separatedBy: "\n")
let dl = dd.map { $0.components(separatedBy: "   ") }.map { Int($0[0])! }.sorted { $0 > $1 }
let dr = dd.map { $0.components(separatedBy: "   ") }.map { Int($0[1])! }.sorted { $0 > $1 }

var cnt = 0
for i in 0..<dl.count {
    cnt += abs(dl[i] - dr[i])
}

print(cnt)
