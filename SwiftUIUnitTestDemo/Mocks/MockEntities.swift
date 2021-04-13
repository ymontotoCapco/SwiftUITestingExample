//
//  MockEntities.swift
//  SwiftUITestingExample (iOS)
//
//  Created by ymnt on 4/12/21.
//

import Foundation

struct MockEntities {
    static let positiveEntity = MockEntity(currency: 100.44, debtStatus: DebtStatus.none.rawValue, name: "Yon")
    static let someDebitEntity = MockEntity(currency: -100.44, debtStatus: DebtStatus.some.rawValue, name: "Yon")
    static let negitiveEntity = MockEntity(currency: -1000.44, debtStatus: DebtStatus.high.rawValue, name: "Yon")
}
