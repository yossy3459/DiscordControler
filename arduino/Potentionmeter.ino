#include "DiscordLink.h"

// データ取得とマップ
void Potentionmeter::getPot()
{
  int rawData;
  rawData = analogRead(potPin);
  currentValue = map(rawData, 0, 1023, 0, 10);
}

// 前の値から変更があったら、Serial Write
void Potentionmeter::checkBeforeValue()
{
  if (currentValue != beforeValue){
    // 値更新
    beforeValue = currentValue;

    // 0.5s delay
    delay(500);
    
    // それでも同じならvolume更新
    if (currentValue == beforeValue){
      Serial.println("vol");
      Serial.println(currentValue);
    }
  }
}

