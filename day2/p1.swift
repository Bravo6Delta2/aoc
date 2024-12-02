import Foundation

extension Array where Element: Comparable {
    var isSortedAscending: Bool {
        for i in 0..<self.count - 1 {
            if self[i] > self[i + 1] {
                return false
            }
        }
        return true
    }

    var isSortedDescending: Bool {
        for i in 0..<self.count - 1 {
            if self[i] < self[i + 1] {
                return false
            }
        }
        return true
    }
}

func isOk(_ arr: [Int]) -> Bool {
    for i in 0..<arr.count - 1 {
        if abs(arr[i] - arr[i+1]) > 3 || abs(arr[i] - arr[i+1]) == 0 {
            return false
        }
    }
    return true
}

var text = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""

do {
    text = try String(contentsOfFile: "input.txt", encoding: .utf8)
} catch {
    print("Error reading contents: \(error.localizedDescription)")
}

var dd = text.components(separatedBy: "\n").map { el in el.components(separatedBy: " ").map { Int($0)! } }

var cnt = 0
for arr in dd {
    if arr.isSortedAscending || arr.isSortedDescending {
        cnt += isOk(arr) ? 1 : 0
    }
}

print(cnt)
