//
//  BarCodeScannerViewModel.swift
//  BarCodeScanner
//
//  Created by Vaibhu Thakkar on 31/12/24.
//

import SwiftUI

class BarCodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
