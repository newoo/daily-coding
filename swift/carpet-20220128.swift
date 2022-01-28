import Foundation

/**
 카펫의 가로 세로 크기를 알아햐한다
 
 주어진 것 : 갈색격자의 수 & 노란격자의 수
 
 조건
 8 <= brown <= 5000
 1 <= yellow <= 2000000
 carpet_width >= carpet_height
 */

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
  guard let yellowSquare = getSquare(brown: brown, yellow: yellow)
          .first(where: { isWrap(brown: brown, yellowSquare: $0) }) else {
    return []
  }
  
  return getSize(yellowSquare: yellowSquare)
}

// 노란격자의 width, height 경우의 수를 반환해주는 함수
func getSquare(brown: Int, yellow: Int) -> [(width: Int, height: Int)] {
  var arr = [(width: Int, height: Int)]()
  
  let maxHeight = max(yellow, brown / 2 - 3)
  
  for height in (1...maxHeight) {
    if yellow % height != 0 {
      continue
    }
    
    let width = yellow / height
    
    guard width >= height else {
      break
    }
    
    arr.append((width, height))
  }
  
  return arr
}

// 노란격자 형태에 따라 갈색격자가 감쌀 수 있는지
func isWrap(brown:Int, yellowSquare: (width: Int, height: Int)) -> Bool {
  brown == (yellowSquare.width + yellowSquare.height) * 2 + 4
}

func getSize(yellowSquare: (width: Int, height: Int)) -> [Int] {
  [yellowSquare.width + 2, yellowSquare.height + 2]
}

print(solution(10, 2)) // [4, 3]
print(solution(8, 1)) // [3, 3]
print(solution(24, 24)) // [8, 6]
