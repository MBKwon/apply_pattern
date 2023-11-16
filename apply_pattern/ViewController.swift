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

    var state: State?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let presentor = Presentor(timeLabel: self.timeLabel, actionButton: self.actionButton)
        self.state = InitState(presentor: presentor)
    }
}

extension ViewController {
    @IBAction private func touchActionButton() {
        self.state = self.state?.nextState
        self.state?.updateUI()
    }
}

