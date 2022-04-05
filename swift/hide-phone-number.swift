
// https://programmers.co.kr/learn/courses/30/lessons/12948


func solution(_ phone_number:String) -> String {
    phone_number.map { String($0) }
        .enumerated()
        .map {
            (phone_number.count - 4...phone_number.count - 1).contains($0.offset)
                ? String($0.element)
                : "*"
        }.joined()
}
