//
//  CSVVisitor.swift
//  KFCSV
//
//  Created by rick on 17/08/15.
//  Copyright (c) 2015 KF Interactive Gmbh. All rights reserved.
//

import Foundation

public protocol CSVVistor {
    
    func visitRow(row: CSVRow)
}