import Foundation
import CollectionSplitting
import StringFormatting

public extension BinaryInteger {
    
    var digitCount: Int {
        var x = self
        var k = 1
        while x / 10 != 0 {
            k += 1
            x /= 10
        }
        return k
    }
    
    func digits<Base: BinaryInteger>(base: Base) -> [Self] {
        
        guard base > 1 else { return [] }
        guard self != 0 else { return [0] }
        
        let b = Int(base)
        var m = Int(self) > 0 ? Int(self) : -Int(self)
        
        var res: [Self] = []
        while m != 0 {
            let (q, r) = m.quotientAndRemainder(dividingBy: b)
            m = q
            res += [ Self(truncatingIfNeeded: r) ]
        }
        
        return res.reversed()
        
    }
    
    var binaryDigits: [Self] {
        return digits(base: 2)
    }
    
    var decimalDigits: [Self] {
        return digits(base: 10)
    }
    
    func digitString<Base: BinaryInteger>(
        base: Base,
        separator c: Character,
        every n: Int
    ) -> String {
        
        guard self != 0 else { return "0" }
        guard base > 1 && n >= 0 else { return "" }
        guard n > 0 else { return digits(base: base).map(String.init).joined() }
        
        let x = digits(base: base)
            .reversed()
            .map(String.init)
            .split(maxSize: Int(n))
            .map { $0.joined() }
            .joined(separator: String(c))
            .reversed()
        
        return String(x)
        
    }
    
    func binaryString(
        separator c: Character = ".",
        every n: Int = 0,
        fullBithWidth: Bool = false
    ) -> String {
        
        guard self >= 0 else {
            fatalError(
                "binaryString(separator: every: fullBithWidth:) not yet implemented for negative self values."
            )
        }
        
        let x = (0 ..< bitWidth).map { (self >> $0) % 2 }
        var y: ArraySlice = x[0 ..< x.count]
        if fullBithWidth == false {
            while y.last == 0 { y = y.dropLast() }
            if y.isEmpty { y = [0] }
        }
        let z = y.map(String.init)
        let w: String
        if n > 0 {
            w = z.split(maxSize: Int(n))
                .map { $0.joined() }
                .joined(separator: String(c))
        } else {
            w = z.joined()
        }
        
        return String(w.reversed())
        
    }
    
    func decimalString(
        separator c: Character = ",",
        every n: Int = 3
    ) -> String {
        return (self < 0 ? "-" : "") + digitString(base: 10, separator: c, every: n)
    }
    
    func formatted(
        width: Int,
        leftPadding: Character = " ",
        rightPadding: Character = " ",
        alignment: String.Alignment = .right
    ) -> String {
        return decimalString().formatted(width: width,
                                         leftPadding: leftPadding,
                                         rightPadding: rightPadding,
                                         alignment: alignment)
    }
    
    var description: String {
        return decimalString()
    }
    
}
