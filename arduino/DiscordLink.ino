#include "DiscordLink.h"

Switch sw;
Potentionmeter pot;
Mic mic;
LED led;

void setup() {
  // Serial通信開始
  Serial.begin(9600);

  // PinMode設定(PULLUP抵抗を使いたい
  pinMode(sw2, INPUT_PULLUP);
  pinMode(sw3, INPUT_PULLUP);
  pinMode(sw4, INPUT_PULLUP);
  pinMode(sw5, INPUT_PULLUP);
  pinMode(sw6, INPUT_PULLUP);
  pinMode(sw7, INPUT_PULLUP);
  pinMode(led8, OUTPUT);
  pinMode(led9, OUTPUT);
  pinMode(led10, OUTPUT);
}

void loop() {
  // スイッチ: 状態記憶あり
  isSw2 = sw.isClick(sw2, isSw2);
  isSw3 = sw.isClick(sw3, isSw3);
  isSw4 = sw.isClick(sw4, isSw4);

  // スイッチ: 状態記憶なし
  sw.isClick(sw5);
  sw.isClick(sw6);
  sw.isClick(sw7);

  // 可変抵抗
  pot.getPot();
  pot.checkBeforeValue();
  
  // マイク
  mic.getMic();
  mic.checkThreshold();

  // LED
  led.writeLED();
}
