//
//  Presentor.swift
//  apply_pattern
//
//  Created by Moonbeom KWON on 2023/11/16.
//

import UIKit

protocol State {
    var presentor: Presentor { get }
    var nextState: State { get }

    func updateUI()
}

class Presentor {
    var timeLabel: UILabel
    var actionButton: UIButton

    private var startDate: Date?
    private var stopDate: Date?
    private var timer: Timer?

    var isSuspended: Bool {
        return self.startDate != nil && self.stopDate != nil
    }

    init(timeLabel: UILabel, actionButton: UIButton) {
        self.timeLabel = timeLabel
        self.actionButton = actionButton
    }
}

extension Presentor {
    func getStartDate() -> Date? {
        return self.startDate
    }

    func setStartDate(_ date: Date) {
        self.startDate = date
    }

    func getStopDate() -> Date? {
        return self.stopDate
    }

    func setStopDate(_ date: Date?) {
        self.stopDate = date
    }
}

extension Presentor {
    func scheduleTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01,
                                          target: self,
                                          selector: #selector(updateTimeLabel),
                                          userInfo: nil,
                                          repeats: true)
    }

    func invalidateTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }

    @objc private func updateTimeLabel() {
        guard let startDate = self.startDate else {
            self.timeLabel.text = "Time Label"
            return
        }

        if let stopDate = self.stopDate {
            let timeInterval = stopDate.timeIntervalSince(startDate)
            let str = String(format: "%.2f", timeInterval)
            self.timeLabel.text = "\(str) s"
        } else {
            let timeInterval = Date().timeIntervalSince(startDate)
            let str = String(format: "%.2f", timeInterval)
            self.timeLabel.text = "\(str) s"
        }
    }
}
