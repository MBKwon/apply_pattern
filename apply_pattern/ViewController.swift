//
//  ViewController.swift
//  apply_pattern
//
//  Created by Moonbeom KWON on 2023/11/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!

    private var startDate: Date?
    private var stopDate: Date?
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController {
    @IBAction private func touchActionButton() {
        if self.startDate == nil {
            self.startDate = Date()
            self.scheduleTimer()
            self.actionButton.setTitle("정지", for: .normal)

        } else if self.stopDate == nil {
            self.stopDate = Date()
            self.invalidateTimer()
            self.actionButton.setTitle("재시작", for: .normal)

        } else if let stopDate = self.stopDate, let startDate = self.startDate {
            let suspendedInterval = Date().timeIntervalSince(stopDate)
            self.startDate = startDate.addingTimeInterval(suspendedInterval)
            self.stopDate = nil
            self.scheduleTimer()
            self.actionButton.setTitle("정지", for: .normal)
        }
    }

    private func scheduleTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01,
                                          target: self,
                                          selector: #selector(updateTimeLabel),
                                          userInfo: nil,
                                          repeats: true)
    }

    private func invalidateTimer() {
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

