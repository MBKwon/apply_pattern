//
//  InitState.swift
//  apply_pattern
//
//  Created by Moonbeom KWON on 2023/11/16.
//

import UIKit

class InitState: State {
    var presentor: Presentor
    var nextState: State {
        return RunState(presentor: self.presentor)
    }

    init(presentor: Presentor) {
        self.presentor = presentor
    }

    func updateUI() {
        do { }
    }
}
