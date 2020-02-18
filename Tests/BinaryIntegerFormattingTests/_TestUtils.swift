import Foundation

extension Array where Element == Int {

    static func random(count: Int, a: Int = -20, b: Int = 20) -> [Int] {
        guard count > 0 else { return [] }
        return (1 ... count).map { _ in Int.random(in: a ... b) }
    }

    static var random: [Int] {
        [Int].random(count: Int.random(in: 0 ... 20), a: -20, b: 20)
    }

}
