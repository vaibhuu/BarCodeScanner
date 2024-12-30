//
//  BarCodeScannerView.swift
//  BarCodeScanner
//
//  Created by Vaibhu Thakkar on 26/12/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong witg camera. We are unable to caoture the input.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type",
                                              message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismissButton: .default(Text("Ok")))
}

struct BarCodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScannerViewRepresentable(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 65)
                
                    Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                        
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alert in
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
