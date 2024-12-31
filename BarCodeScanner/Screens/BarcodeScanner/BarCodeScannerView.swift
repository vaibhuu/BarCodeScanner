//
//  BarCodeScannerView.swift
//  BarCodeScanner
//
//  Created by Vaibhu Thakkar on 26/12/24.
//

import SwiftUI

struct BarCodeScannerView: View {
    
    @StateObject var viewModel = BarCodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScannerViewRepresentable(scannedCode: $viewModel.scannedCode,
                                         alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 65)
                
                    Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                        
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: Text(alert.title),
                      message: Text(alert.message),
                      dismissButton: alert.dismissButton)
            }
        }
    }
}

#Preview {
    BarCodeScannerView()
}
