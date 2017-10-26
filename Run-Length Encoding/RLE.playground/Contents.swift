//压缩算法：变动长度编码法RLE
import Foundation

extension Data {
    public func compressRLE() -> Data {
        var data = Data()
        self.withUnsafeBytes { (uPtr: UnsafePointer<UInt8>) in
            var ptr = uPtr
            let end = ptr + count
            while ptr < end {
                var count = 0
                var byte = ptr.pointee
                var next = byte

                while next == byte && ptr < end && count < 64 {
                    ptr =  ptr.advanced(by: 1)
                    next = ptr.pointee
                    count += 1
                }
                print(ptr, end, count, byte, next)

                if count > 1 || byte >= 192 {
                    var size = 191 + UInt8(count)
                    data.append(&size, count: 1)
                    data.append(&byte, count: 1)
                } else {
                    print("1")
                    data.append(&byte, count: 1)
                }
            }
        }
        return data
    }
    
    public func decompressRLE() -> Data {
        var data = Data()
        self.withUnsafeBytes { (uPtr: UnsafePointer<UInt8>) in
            var ptr = uPtr
            let end = ptr + count
            while ptr < end {
                var byte = ptr.pointee
                ptr  = ptr.advanced(by: 1)
                
                if byte < 192 {
                    data.append(&byte, count: 1)
                } else if ptr < end {
                    var value = ptr.pointee
                    ptr = ptr.advanced(by: 1)
                    for _ in 0 ..< byte - 191 {
                        data.append(&value, count: 1)
                    }
                }
            }
        }
        return data
    }
}

func encodeAndDecode(_ bytes: [UInt8]) -> Bool {
    var bytes = bytes
    var data1 = Data(bytes: &bytes, count: bytes.count)
    print("data1 is \(data1.count) bytes")
    
    var rleData = data1.compressRLE()
    print("encoded data is \(rleData.count) bytes")
    
    var data2 = rleData.decompressRLE()
    print("data2 is \(data2.count) bytes")
    
    return data1 == data2
}

func testEmpty() -> Bool {
    let bytes: [UInt8] = []
    return encodeAndDecode(bytes)
}



let originalString = "aaaaabbbcdeeeeeeef"
let utf8 = originalString.data(using: String.Encoding.utf8)!
let compressed = utf8.compressRLE()

let decompressed = compressed.decompressRLE()
let restoredString = String(data: decompressed, encoding: String.Encoding.utf8)
originalString == restoredString
