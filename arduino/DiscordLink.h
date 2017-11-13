#ifndef DISCORDLINK_H
#define DISCORDLINK_H

// button input
int sw2 = 2; // userMic
int sw3 = 3;
int sw4 = 4;
int sw5 = 5;
int sw6 = 6;
int sw7 = 7;

// led output
int led8 = 8;
int led9 = 9;
int led10 = 10;

// Analog Pin
int potPin = A0;
int micPin = A1;

// 状態保持用属性
bool isSw2 = false;
bool isSw3 = false;
bool isSw4 = false;

// マイク閾値
const int threshold = 128;

// スイッチクラス
class Switch{
  public:
    void isClick(int);
    bool isClick(int, bool);
};

// 可変抵抗クラス
class Potentionmeter{
  public:
    void getPot();
    void checkBeforeValue();
  private:
    float beforeValue = 0;
    float currentValue;
};

// マイククラス
class Mic{
  public:
    void getMic();
    void checkThreshold();
};

// LEDクラス
class LED{
  public:
    void writeLED();
};

#endif
