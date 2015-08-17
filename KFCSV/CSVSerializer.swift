//
//  CSV.swift
//  KFCSV
//
//  Created by rick on 17/08/15.
//  Copyright © 2015 KF Interactive Gmbh. All rights reserved.
//

import Foundation

public class CSVSerializer: CSVVistor {
    
    let literalChar: String
    let separatorChar: String
    let lineBreak: String
    
    var output = ""
    
    public var serializedOutput: String {
        return output
    }
    
    public init(literalChar: String = "", separatorChar: String = ",", lineBreak: String = "\n") {
        self.literalChar = literalChar
        self.separatorChar = separatorChar
        self.lineBreak = lineBreak
    }
    
    public func serialize(component: CSVComponent) {
        component.accept(self)
    }

    public func visitRow(row: CSVRow) {
        let values = row.values
        let formattedValues = values.map { "\(self.literalChar)\($0)\(self.literalChar)"}
        let csv = separatorChar.join(formattedValues)
        appendLine(csv)
    }
    
    func appendLine(csv: String) {
        output += csv + lineBreak
    }
}