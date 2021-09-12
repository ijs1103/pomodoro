//
//  ViewController.swift
//  pomodoro
//
//  Created by Gunter on 2021/09/12.
//

import UIKit

enum TimerStatus {
  case start
  case pause
  case end
}

class ViewController: UIViewController {

  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var datePicker: UIDatePicker!

  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var toggleButton: UIButton!

  var duration = 60
  var timerStatus: TimerStatus = .end
  var currentSeconds = 0
  var timer: DispatchSourceTimer?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureToggleButton()
  }

  @IBAction func tapCancelButton(_ sender: UIButton) {
    switch self.timerStatus {
    case .start, .pause:
      self.stopTimer()

    default:
      break
    }
  }

  @IBAction func tapToggleButton(_ sender: UIButton) {
    self.duration = Int(self.datePicker.countDownDuration)
    switch self.timerStatus {
    case .end:
      self.currentSeconds = duration
      self.timerStatus = .start
      self.setTimerInfoViewVisible(isHidden: false)
      self.datePicker.isHidden = true
      self.toggleButton.isSelected = true
      self.cancelButton.isEnabled = true
      self.startTimer()

    case .start:
      self.timerStatus = .pause
      self.toggleButton.isSelected = false
      self.timer?.suspend()

    case .pause:
      self.timerStatus = .start
      self.toggleButton.isSelected = true
      self.timer?.resume()
    }
  }

  func configureToggleButton() {
    self.toggleButton.setTitle("시작", for: .normal)
    self.toggleButton.setTitle("일시정지", for: .selected)
  }

  func setTimerInfoViewVisible(isHidden: Bool) {
    self.timerLabel.isHidden = isHidden
    self.progressView.isHidden = isHidden
  }

  func startTimer() {
    if self.timer == nil {
      self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
      self.timer?.schedule(deadline: .now(), repeating: 1)
      self.timer?.setEventHandler(handler: { [weak self] in
        guard let self = self else { return }
        self.currentSeconds -= 1
        let hour = self.currentSeconds / 3600
        let minutes = (self.currentSeconds % 3600) / 60
        let seconds = (self.currentSeconds % 3600) % 60
        self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
        self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
        debugPrint(self.progressView.progress)
        if self.currentSeconds <= 0 {
          self.stopTimer()
        }
      })
      self.timer?.resume()
    }
  }

  func stopTimer() {
    if self.timerStatus == .pause {
      self.timer?.resume()
    }
    self.timerStatus = .end
    self.cancelButton.isEnabled = false
    self.setTimerInfoViewVisible(isHidden: true)
    self.datePicker.isHidden = false
    self.toggleButton.isSelected = false
    self.timer?.cancel()
    self.timer = nil
  }
}

