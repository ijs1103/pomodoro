# pomodoro
![Simulator Screen Recording - iPod touch (7th generation) - 2023-01-23 at 01 05 36](https://user-images.githubusercontent.com/42196410/213926120-b58cd4c4-2fe4-4057-97ff-725d29cfd7e7.gif)


## ๐งฉ ๊ฐ์

์๊ฐ์ ์ค์  ํ  ์ ์๋ pomodoro(์คํ์์น)

## ๐ค ๋ฐฐ์ด ๋ด์ฉ

### โ๏ธ UIDatePicker

mode: Count Down Timer๋ก ํต์์ ์ธ ์คํฑ์์น ui๋ฅผ ์ฌ์ฉํ  ์ ์๋ค.

UIDatePicker.countDownDuration์ผ๋ก ์ ์ ๊ฐ ์ค์ ํ ์๊ฐ์ get ํ  ์ ์๋ค. 

### โ๏ธ DispatchSourceTimer

GCD api์ธ `DispatchSourceTimer`๋ก `UIDatePicker`์์ ์ค์ ํ ์๊ฐ์ ํ๋ฉด์ ํ์ํด์ฃผ๋ event handler๋ฅผ ์ธํํ๋ค.

### โ๏ธ View์ animation ์ ์ฉ

๋ณด๋ค ์์ฐ์ค๋ฌ์ด animation ํจ๊ณผ๋ฅผ ์ํ์ฌ View์ hidden ์์ฑ์ on/off ํ๊ธฐ ๋ณด๋ค, alpha๊ฐ์ 0->1, 1->0์ผ๋ก ์ธํํ๋ค.

```
UIView.animate(withDuration: 0.5, animations: {
  self.timerLabel.alpha = 1
  self.progressView.alpha = 1
  self.datePicker.alpha = 0
})
```
