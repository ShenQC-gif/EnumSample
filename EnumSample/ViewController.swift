//
//  ViewController.swift
//  EnumSample
//
//  Created by ちいつんしん on 2021/03/11.
//

import UIKit

class ViewController: UIViewController {

    private var mode = Mode()

    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var nextModeButton: UIButton!
    @IBOutlet weak var previousModeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        modeLabel.text = mode.returnTitle()
    }

    @IBAction func didTapNextModeButton(_ sender: Any) {
        mode.nextMode()
        modeLabel.text = mode.returnTitle()
        nextModeButton.isHidden = !mode.nextModeExists()
        previousModeButton.isHidden = !mode.previousModeExists()
    }

    @IBAction func didTapPreviousModeButton(_ sender: Any) {
        mode.previousMode()
        modeLabel.text = mode.returnTitle()
        nextModeButton.isHidden = !mode.nextModeExists()
        previousModeButton.isHidden = !mode.previousModeExists()
    }
}

enum Mode : Int{

    //難易度を3つ用意
    case Easy
    case Normal
    case Hard

    //初期値としてNormalを指定
    init() {
        self = Mode.Normal
    }

    //次の難易度があれば変更、なければ何もしない
    mutating func nextMode() {
        if let nextMode = Mode(rawValue: rawValue + 1) {
            self = nextMode
        } else {
            return
        }
    }

    //次の難易度があればtrue、なければfalse
    func nextModeExists() -> Bool {
        var ifExist: Bool

        if Mode(rawValue: rawValue + 1) != nil {
            ifExist = true
        } else {
            ifExist = false
        }

        return ifExist
    }

    //前の難易度があれば変更、なければ何もしない
    mutating func previousMode() {
        if let previousMode = Mode(rawValue: rawValue - 1) {
            self = previousMode
        } else {
            return
        }
    }

    //前の難易度があればtrue、なければfalse
    func previousModeExists() -> Bool {
        var ifExist: Bool

        if Mode(rawValue: rawValue - 1) != nil {
            ifExist = true
        } else {
            ifExist = false
        }

        return ifExist
    }

    //難易度毎のタイトルを返す
    func returnTitle() -> String {
        switch self {
        case .Easy:
            return "Easy"

        case .Normal:
            return "Normal"

        case .Hard:
            return "Hard"

        }
    }
}

