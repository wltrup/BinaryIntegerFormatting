import XCTest
@testable import BinaryIntegerFormatting

final class BinaryIntegerFormattingTests: XCTestCase {

    func test_digitCount1() {
        let n = Int.random(in: 0 ... 9)
        let exp = 1
        let res = n.digitCount
        XCTAssert(res == exp, "n = \(n), exp = '\(exp)', res = '\(res)'")
    }

    func test_digitCount3() {
        let n = Int.random(in: 100 ... 999)
        let exp = 3
        let res = n.digitCount
        XCTAssert(res == exp, "n = \(n), exp = '\(exp)', res = '\(res)'")
    }

    func test_digitCount() {
        let dc = Int.random(in: 1 ... 10)
        let n = Int(pow(10.0, Double(dc-1)))
        let exp = dc
        let res = n.digitCount
        XCTAssert(res == exp, "n = \(n), exp = '\(exp)', res = '\(res)'")
    }

    func test_digits_invalid_base_neg() {
        let x = Int.random(in: 1 ... 1234567)
        let b = Int.random(in: -10 ... -1)
        let res = x.digits(base: b)
        XCTAssertTrue(res == [])
    }

    func test_digits_invalid_base_zero() {
        let x = Int.random(in: 1 ... 1234567)
        let b = 0
        let res = x.digits(base: b)
        XCTAssertTrue(res == [])
    }

    func test_digits_invalid_base_one() {
        let x = Int.random(in: 1 ... 1234567)
        let b = 1
        let res = x.digits(base: b)
        XCTAssertTrue(res == [])
    }

    func test_digits_negative_self() {
        let x = Int.random(in: 1 ... 1234567)
        let b = Int.random(in: 2 ... 10)
        XCTAssertTrue(x.digits(base: b) == (-x).digits(base: b))
    }

    func test_digits_zero_self() {
        let x = 0
        let b = Int.random(in: 2 ... 10)
        let exp = [0]
        let res = x.digits(base: b)
        XCTAssertTrue(res == exp)
    }

    func test_digits_specific() {
        let x = 1234567
        let b = 10
        let exp = [1, 2, 3, 4, 5, 6, 7]
        let res = x.digits(base: b)
        XCTAssertTrue(res == exp)
    }

    func test_digits_general() {
        let b = Int.random(in: 2 ... 10)
        let exp = [Int.random(in: 1 ... b-1)] +
            [Int].random(count: Int.random(in: 1 ... 10), a: 0, b: b-1)
        let x = exp.reduce(0) { (b * $0) + $1 }
        let res = x.digits(base: b)
        XCTAssertTrue(res == exp)
    }

    func test_binaryDigits() {
        let exp = [1] + [Int].random(count: Int.random(in: 1 ... 10), a: 0, b: 1)
        let x = exp.reduce(0) { (2 * $0) + $1 }
        let res = x.binaryDigits
        XCTAssertTrue(res == exp)
    }

    func test_decimalDigits() {
        let exp = [Int.random(in: 1 ... 9)] +
            [Int].random(count: Int.random(in: 1 ... 10), a: 0, b: 9)
        let x = exp.reduce(0) { (10 * $0) + $1 }
        let res = x.decimalDigits
        XCTAssertTrue(res == exp)
    }

    func test_digitString_invalid_base_neg() {
        let x = Int.random(in: 1 ... 1234567)
        let b = Int.random(in: -10 ... -1)
        let n = Int.random(in: 1 ... 5)
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == "")
    }

    func test_digitString_invalid_base_zero() {
        let x = Int.random(in: 1 ... 1234567)
        let b = 0
        let n = Int.random(in: 1 ... 5)
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == "")
    }

    func test_digitString_invalid_base_one() {
        let x = Int.random(in: 1 ... 1234567)
        let b = 1
        let n = Int.random(in: 1 ... 5)
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == "")
    }

    func test_digitString_negative_self() {
        let x = Int.random(in: 1 ... 1234567)
        let b = Int.random(in: 2 ... 5)
        let n = Int.random(in: 0 ... 5)
        let res1 =    x.digitString(base: b, separator: Character("a"), every: n)
        let res2 = (-x).digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res1 == res2)
    }

    func test_digitString_zero_self() {
        let x = 0
        let b = Int.random(in: 2 ... 5)
        let n = Int.random(in: 0 ... 5)
        let exp = "0"
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == exp)
    }

    func test_digitString_invalid_every_neg() {
        let x = Int.random(in: 1 ... 1234567)
        let b = Int.random(in: 2 ... 5)
        let n = Int.random(in: -3 ... -1)
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == "")
    }

    func test_digitString_zero_every_specific() {
        let x = 1234567
        let n = 0
        let b = 10
        let exp = "1234567"
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == exp)
    }

    func test_digitString_specific() {
        let x = 1234567
        let n = 3
        let b = 10
        let exp = "1a234a567"
        let res = x.digitString(base: b, separator: Character("a"), every: n)
        XCTAssertTrue(res == exp)
    }

//    func test_binaryString_neg_self() {
//        let x = -10
//        let exp = "N/A"
//        let res = x.binaryString(separator: Character("a"), every: 5, fullBithWidth: false)
//        XCTAssertTrue(res == exp)
//    }

    func test_binaryString_zero_fullW_true() {
        let x = 0
        let exp = "0000a00000a00000a00000a00000a00000a00000a00000a00000a00000a00000a00000a00000"
        let res = x.binaryString(separator: Character("a"), every: 5, fullBithWidth: true)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_zero_fullW_false() {
        let x = 0
        let exp = "0"
        let res = x.binaryString(separator: Character("a"), every: 5, fullBithWidth: false)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_pos_self_fullW_true() {
        let x = 1234567
        let n = 5
        let exp = "0000a00000a00000a00000a00000a00000a00000a00000a00001a00101a10101a10100a00111"
        let res = x.binaryString(separator: Character("a"), every: n, fullBithWidth: true)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_pos_self_fullW_false() {
        let x = 1234567
        let n = 5
        let exp = "1a00101a10101a10100a00111"
        let res = x.binaryString(separator: Character("a"), every: n, fullBithWidth: false)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_zero_every_fullW_true() {
        let x = 1234567
        let n = 0
        let exp = "0000000000000000000000000000000000000000000100101101011010000111"
        let res = x.binaryString(separator: Character("a"), every: n, fullBithWidth: true)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_zero_every_fullW_false() {
        let x = 1234567
        let n = 0
        let exp = "100101101011010000111"
        let res = x.binaryString(separator: Character("a"), every: n, fullBithWidth: false)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_pos_self_fullW_true_UInt16() {
        let x: UInt16 = 5523
        let n = 4
        let exp = "0001.0101.1001.0011"
        let res = x.binaryString(separator: Character("."), every: n, fullBithWidth: true)
        XCTAssertTrue(res == exp)
    }

    func test_binaryString_pos_self_fullW_false_UInt16() {
        let x: UInt16 = 5523
        let n = 4
        let exp = "1.0101.1001.0011"
        let res = x.binaryString(separator: Character("."), every: n, fullBithWidth: false)
        XCTAssertTrue(res == exp)
    }

    func test_decimalString_zero_self() {
        let x = 0
        let n = Int.random(in: 0 ... 5)
        let exp = "0"
        let res = x.decimalString(separator: Character("a"), every: n)
        XCTAssertTrue(res == exp)
    }

    func test_decimalString_pos_self() {
        let x = 1234567
        let n = 5
        let exp = "12a34567"
        let res = x.decimalString(separator: Character("a"), every: n)
        XCTAssertTrue(res == exp)
    }

    func test_decimalString_neg_self() {
        let x = -1234567
        let n = 5
        let exp = "-12a34567"
        let res = x.decimalString(separator: Character("a"), every: n)
        XCTAssertTrue(res == exp)
    }

    func test_description() {
        let x = Int.random(in: -12345 ... 12345)
        let exp = x.decimalString()
        let res = x.description
        XCTAssertTrue(res == exp)
    }

    func test_format() {
        for alignment in [String.Alignment.left, String.Alignment.center, String.Alignment.right] {
            let x = Int.random(in: -12345 ... 12345)
            let maxLength = Int.random(in: 6 ... 10)
            let exp = x.decimalString().formatted(width: maxLength,
                                                  leftPadding: "L",
                                                  rightPadding: "R",
                                                  alignment: alignment)
            let res = x.formatted(width: maxLength,
                                  leftPadding: "L",
                                  rightPadding: "R",
                                  alignment: alignment)
            XCTAssertTrue(res == exp)
        }
    }

}
