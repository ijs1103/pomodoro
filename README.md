# pomodoro
![Simulator Screen Recording - iPod touch (7th generation) - 2023-01-23 at 01 05 36](https://user-images.githubusercontent.com/42196410/213926120-b58cd4c4-2fe4-4057-97ff-725d29cfd7e7.gif)


## 🧩 개요

시간을 설정 할 수 있는 pomodoro(스탑워치)

## 🤔 배운 내용

### ✔️ UIDatePicker

mode: Count Down Timer로 통상적인 스톱워치 ui를 사용할 수 있다.

UIDatePicker.countDownDuration으로 유저가 설정한 시간을 get 할 수 있다. 

### ✔️ DispatchSourceTimer

GCD api인 `DispatchSourceTimer`로 `UIDatePicker`에서 설정한 시간을 화면에 표시해주는 event handler를 세팅한다.

### ✔️ View에 animation 적용

보다 자연스러운 animation 효과를 위하여 View에 hidden 속성을 on/off 하기 보다, alpha값을 0->1, 1->0으로 세팅한다.

```
UIView.animate(withDuration: 0.5, animations: {
  self.timerLabel.alpha = 1
  self.progressView.alpha = 1
  self.datePicker.alpha = 0
})
```
