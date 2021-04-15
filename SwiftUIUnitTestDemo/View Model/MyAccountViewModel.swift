//
//  MyAccountViewModel.swift
//  SwiftUITestingExample (iOS)
//
//  Created by ymnt on 4/12/21.
//
import Foundation
import SwiftUI

class MyAccountViewModel: ObservableObject {
    
    @Published var entity: MockEntity = MockEntities.positiveEntity
    /*
     Think of an entity as the data you get from the serive
     without any modifications. It's pure.
     */
    init(with entity: MockEntity) {
        self.entity = entity
    }
    
    var debtStatusList: [MockEntity] {
        return [MockEntities.positiveEntity, MockEntities.someDebitEntity, MockEntities.negitiveEntity]
    }
    
    var formattedDebtCurrency: String {
        return MyAccountViewModel.USDCurrencyFormatter(entity.currency)
    }
    
    var currentDebtStatusColor: Color {
        return MyAccountViewModel.statusColor(for: entity.debtStatus)
    }
    
    
    private static func USDCurrencyFormatter(_ amount: Double) -> String {
        var result: String
        
        if amount >= 0 {
            result = "$\(amount)"
        } else {
            var amountString = String(amount)
            amountString.removeFirst()
            result = "-$\(amountString)"
        }
        
        return result
    }
    
    private static func statusColor(for debtStatus: String) -> Color {
        
        let statusColor = (Color.green, Color.yellow, Color.red)
        
        switch debtStatus {
        case DebtStatus.none.rawValue:
            return statusColor.0
        case DebtStatus.some.rawValue:
            return statusColor.1
        case DebtStatus.high.rawValue:
            return statusColor.2
        default:
            return statusColor.0
        }
    }
    
}

enum DebtStatus: String {
    case none = "NONE"
    case some = "SOME"
    case high = "HIGH"
}
