#include "DiscordLink.h"

// 状態記憶なし
void Switch::isClick(int pin)
{ 
  if (digitalRead(pin) == LOW) {
    // Serial Write
    Serial.print("sw");
    Serial.println(pin);
    delay(200);
  }
}

// 状態記憶あり
bool Switch::isClick(int pin, bool value)
{ 
  if (digitalRead(pin) == LOW) {
    // State反転
    value = !value;

    // Serial Write
    Serial.print("sw");
    Serial.println(pin);
    Serial.println(value);
    delay(200);
  }

  return value;
}
