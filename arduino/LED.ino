#include "DiscordLink.h"

void LED::writeLED()
{
  // LED更新
  digitalWrite(led8, isSw2);
  digitalWrite(led9, isSw3);
  digitalWrite(led10, isSw4);
}

