import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
  strings.sorted().sorted(by: { index(n, in: $0) < index(n, in: $1) })
}

func index(_ n: Int, in string: String) -> String {
  string.map { String($0) }[n]
}

print(solution(["sun", "bed", "car"], 1)) // ["car", "bed", "sun"]
print(solution(["abce", "abcd", "cdx"], 2)) // ["abcd", "abce", "cdx"]

