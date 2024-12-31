//
//  ScannerViewRepresentable.swift
//  BarCodeScanner
//
//  Created by Vaibhu Thakkar on 26/12/24.
//

import SwiftUI

struct ScannerViewRepresentable: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerViewRepresentable: self)
    }
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scammerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private var scannerViewRepresentable: ScannerViewRepresentable
        
        init(scannerViewRepresentable: ScannerViewRepresentable) {
            self.scannerViewRepresentable = scannerViewRepresentable
        }
        
        func didFind(barcode: String) {
            scannerViewRepresentable.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerViewRepresentable.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerViewRepresentable.alertItem = AlertContext.invalidScannedType
            }
        }
        
        
    }
}

#Preview {
    ScannerViewRepresentable(scannedCode: .constant("1234"), alertItem: .constant(AlertItem(title: "", message: "", dismissButton: .cancel())))
}
