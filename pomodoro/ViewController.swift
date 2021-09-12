//
//  ViewController.swift
//  pomodoro
//
//  Created by Gunter on 2021/09/12.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var datePicker: UIDatePicker!

  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var toggleButton: UIButton!

  var duration = 60

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func tapCancelButton(_ sender: UIButton) {
  }

  @IBAction func tapToggleButton(_ sender: UIButton) {
    self.duration = Int(self.datePicker.countDownDuration)
    debugPrint("\(self.duration)")
  }
}

