//
//  Int+Extensions.swift
//  RunAwesome
//
//  Created by JeongminKim on 2022/04/28.
//

import Foundation

extension Int {
    func formatTimeString() -> String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = (self % 3600) % 60
        
        if seconds < 0 {
            return "00:00:00"
        } else {
            if hours == 0 {
                return String(format: "%02d:%02d", minutes, seconds)
            } else {
                return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            }
        }
    }
}
