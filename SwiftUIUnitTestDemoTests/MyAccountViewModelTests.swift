//
//  MyAccountViewModelTests.swift
//  SwiftUITestingExample (iOS)
//
//  Created by ymnt on 4/12/21.
//

import Quick
import Nimble
@testable import SwiftUIUnitTestDemo

class MyAccountViewModelTests: QuickSpec {
    override func spec() {
      describe("My Account View Model") {
        
        context("account balance - positive") {
            let viewModel = MyAccountViewModel(
                with: MockEntities.positiveEntity
            )
          it("should contain the following properties") {
            expect(viewModel.entity.name).to(equal("Yon"))
            expect(viewModel.entity.currency).to(equal(100.44))
            expect(viewModel.entity.debtStatus).to(equal(DebtStatus.none.rawValue))
          }
        }
        
        context("account balance - slightly negitive") {
            let viewModel = MyAccountViewModel(
                with: MockEntities.someDebitEntity
            )
          it("should contain the following properties") {
            expect(viewModel.entity.name).to(equal("Yon"))
            expect(viewModel.entity.currency).to(equal(-100.44))
            expect(viewModel.entity.debtStatus).to(equal(DebtStatus.some.rawValue))
          }
        }
        
        context("account balance - very negitive") {
            let viewModel = MyAccountViewModel(
                with: MockEntities.negitiveEntity
            )
          it("should contain the following properties") {
            expect(viewModel.entity.name).to(equal("Yon"))
            expect(viewModel.entity.currency).to(equal(-1000.44))
            expect(viewModel.entity.debtStatus).to(equal(DebtStatus.high.rawValue))
          }
        }
        
      }
    }
}
