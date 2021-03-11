//
//  ViewController.swift
//  EnumSample
//
//  Created by ちいつんしん on 2021/03/11.
//

import UIKit

class ViewController: UIViewController {

    private var mode = Mode.Normal

    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var nextModeButton: UIButton!
    @IBOutlet weak var previousModeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        modeLabel.text = mode.returnTitle()
    }

    @IBAction func didTapNextModeButton(_ sender: Any) {
        mode = mode.nextMode() ?? mode
        modeLabel.text = mode.returnTitle()
        nextModeButton.isHidden = mode.nextMode() == nil
        previousModeButton.isHidden = mode.previousMode() == nil
    }

    @IBAction func didTapPreviousModeButton(_ sender: Any) {
        mode = mode.previousMode() ?? mode
        modeLabel.text = mode.returnTitle()
        nextModeButton.isHidden = mode.nextMode() == nil
        previousModeButton.isHidden = mode.previousMode() == nil
    }
}

enum Mode : Int{

    //難易度を3つ用意
    case Easy
    case Normal
    case Hard

    func nextMode() -> Mode?{
        Mode(rawValue: self.rawValue + 1)
    }

    func previousMode() -> Mode?{
        Mode(rawValue: self.rawValue - 1)
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

