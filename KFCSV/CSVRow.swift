//
//  CSVRow.swift
//  KFCSV
//
//  Created by rick on 17/08/15.
//  Copyright (c) 2015 KF Interactive Gmbh. All rights reserved.
//

import Foundation

public struct CSVRow: CSVComponent {
    
    let values: [String]
    
    public init(values: [String]) {
        self.values = values
    }
    
    public func accept(visitor: CSVVistor) {
        visitor.visitRow(self)
    }
}