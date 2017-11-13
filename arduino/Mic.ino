#include "DiscordLink.h"

int micInput;

// データ取得
void Mic::getMic()
{
  micInput = analogRead(micPin);
}


void Mic::checkThreshold()
{
    // UserMicオンかつthresholdを超えたら、シリアルにmicを送信
  if (!isSw2)
    if (micInput > threshold){
    isSw2 = true;
    Serial.println("mic");
  }
}

