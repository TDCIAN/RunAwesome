//
//  Double+Extensions.swift
//  RunAwesome
//
//  Created by JeongminKim on 2022/04/28.
//

import Foundation

extension Double {
    func meterToMiles() -> Double {
        let meters = Measurement(value: self, unit: UnitLength.meters)
        return meters.converted(to: .miles).value
    }
    
    func toString(places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
}
