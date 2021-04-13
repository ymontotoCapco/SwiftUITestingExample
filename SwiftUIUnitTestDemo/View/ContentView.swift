//
//  ContentView.swift
//  Shared
//
//  Created by ymnt on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MyAccountViewModel
    
    var body: some View {
        VStack {
            
            // This is the horizontal stack at top of the view that contains the name and the status color.
            HStack (alignment: .bottom) {
                Text(viewModel.entity.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .padding()
                
                Circle().fill(viewModel.getDebtStatusColor())
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .trailing)
                    .padding()
            }.frame(maxHeight: 80)
            
            // This is the vertical stack that holds the converted currency and the picker.
            VStack {
                Text(viewModel.formattedDebtCurrency)
                    .font(.largeTitle)
                
                Picker("Picker", selection: $viewModel.entity) {
                    ForEach(viewModel.debtStatusList, id: \.self) {
                        Text($0.debtStatus)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }.frame(maxHeight: .infinity)
            
        }
        .frame(maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MyAccountViewModel(with: MockEntities.positiveEntity))
    }
}
