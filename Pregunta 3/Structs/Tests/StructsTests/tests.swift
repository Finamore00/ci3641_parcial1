@testable import Structs
import XCTest

class blockRefTableTest : XCTestCase {
    
    func testGetAndReturnBlocks() {
        let l = blockRefTable(size: 4)
        let a = l.getBlock(size: 2)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 1)
        XCTAssert(l.table[1].count == 1)
        XCTAssert(l.table[0].count == 0)
        let b = l.getBlock(size: 2)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 1)
        XCTAssert(l.table[1].count == 0)
        XCTAssert(l.table[0].count == 0)
        let c = l.getBlock(size: 2)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 1)
        XCTAssert(l.table[0].count == 0)
        let d = l.getBlock(size: 2)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 0)
        XCTAssert(l.table[0].count == 0)
        l.returnBlock(b: c)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 1)
        XCTAssert(l.table[0].count == 0)
        l.printTableStatus()
        l.returnBlock(b: b)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 2)
        XCTAssert(l.table[0].count == 0)
        l.printTableStatus()
        l.returnBlock(b: a)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 1)
        XCTAssert(l.table[2].count == 1)
        XCTAssert(l.table[1].count == 1)
        XCTAssert(l.table[0].count == 0)
        l.printTableStatus()
        l.returnBlock(b: d)
        XCTAssert(l.table[4].count == 1)
        XCTAssert(l.table[3].count == 0)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 0)
        XCTAssert(l.table[0].count == 0)
        l.printTableStatus()
        let x = l.getBlock(size: 16)
        XCTAssert(l.table[4].count == 0)
        XCTAssert(l.table[3].count == 0)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 0)
        XCTAssert(l.table[0].count == 0)
        l.printTableStatus()
        l.returnBlock(b: x)
        XCTAssert(l.table[4].count == 1)
        XCTAssert(l.table[3].count == 0)
        XCTAssert(l.table[2].count == 0)
        XCTAssert(l.table[1].count == 0)
        XCTAssert(l.table[0].count == 0)
    }

    let allTests = [
        ("testGetAndReturnBlocks", testGetAndReturnBlocks)
    ]
}