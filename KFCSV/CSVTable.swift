//
//  CSVTable.swift
//  KFCSV
//
//  Created by rick on 17/08/15.
//  Copyright (c) 2015 KF Interactive Gmbh. All rights reserved.
//

import Foundation

public struct CSVTable: CSVComponent {
    
    let rows: [CSVComponent]
    
    public init(rows: [CSVComponent]) {
        self.rows = rows
    }
    
    public func accept(visitor: CSVVistor) {
        for row in rows {
            row.accept(visitor)
        }
    }
    
}