//
//  KFCSVTests.swift
//  KFCSVTests
//
//  Created by rick on 17/08/15.
//  Copyright © 2015 KF Interactive Gmbh. All rights reserved.
//

import XCTest
import KFCSV

class KFCSVTests: XCTestCase {
    
    func testThatSingleRowIsCorrect() {
        let row = CSVRow(values: ["a", "b", "c"])
        let table = CSVTable(rows: [row])
        let serializer = CSVSerializer(literalChar: "", separatorChar: ",", lineBreak: "\n")
        serializer.serialize(table)
        XCTAssertEqual(serializer.serializedOutput, "a,b,c\n")
    }

    func testThatMultipleRowsAreCorrect() {
        let row0 = CSVRow(values: ["a", "b", "c"])
        let row1 = CSVRow(values: ["d", "e", "f"])
        let table = CSVTable(rows: [row0, row1])
        let serializer = CSVSerializer()
        serializer.serialize(table)
        XCTAssertEqual(serializer.serializedOutput, "a,b,c\nd,e,f\n")
    }
    
    func testThatLiteralCharMatches() {
        let row = CSVRow(values: ["a", "b", "c"])
        let table = CSVTable(rows: [row])
        let serializer = CSVSerializer(literalChar: "\"")
        serializer.serialize(table)
        XCTAssertEqual(serializer.serializedOutput, "\"a\",\"b\",\"c\"\n")
    }
    
    func testThatSeparatorCharMatches() {
        let row = CSVRow(values: ["a", "b", "c"])
        let table = CSVTable(rows: [row])
        let serializer = CSVSerializer(separatorChar: "|")
        serializer.serialize(table)
        XCTAssertEqual(serializer.serializedOutput, "a|b|c\n")
    }
    
    func testThatLineBreakCharMatches() {
        let row = CSVRow(values: ["a", "b", "c"])
        let table = CSVTable(rows: [row])
        let serializer = CSVSerializer(lineBreak: "\r\n")
        serializer.serialize(table)
        XCTAssertEqual(serializer.serializedOutput, "a,b,c\r\n")
    }
    
}
