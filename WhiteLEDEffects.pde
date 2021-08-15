void scatter()
{
  if (r == 1)
  {
    count = count + scatterSpeed;
    if (count >= 100 && count <= 199)
    {
      arduino.analogWrite(ledPinWhiteOne, 255);
    }
    if (count >= 200 && count <= 299)
    {
      arduino.analogWrite(ledPinWhiteOne, 0); 
      arduino.analogWrite(ledPinWhiteTwo, 255);
    }
    if (count >= 300 && count <= 399)
    {
      arduino.analogWrite(ledPinWhiteTwo, 0); 
      arduino.analogWrite(ledPinWhiteThree, 255);
    }
    if (count >= 400 && count <= 499)
    {
      arduino.analogWrite(ledPinWhiteThree, 0);
      arduino.analogWrite(ledPinWhiteFour, 255);
    }
    if (count >= 500 && count <= 599)
    {
      arduino.analogWrite(ledPinWhiteFour, 0);
      arduino.analogWrite(ledPinWhiteFive, 255);
    }
    if (count >= 600 && count <= 699)
    {
      arduino.analogWrite(ledPinWhiteFive, 0);
      arduino.analogWrite(ledPinWhiteSix, 255);
    }
    if (count >= 700 && count <= 799)
    {
      arduino.analogWrite(ledPinWhiteSix, 0);
      arduino.analogWrite(ledPinWhiteSeven, 255);
    }
    if (count >= 800 && count <= 899)
    {
      arduino.analogWrite(ledPinWhiteSeven, 0);
      arduino.analogWrite(ledPinWhiteEight, 255);
    }
    if (count >= 900 && count <= 999)
    {
      arduino.analogWrite(ledPinWhiteEight, 0);
      arduino.analogWrite(ledPinWhiteNine, 255);
    }
    if (count >= 1000 && count <= 1099)
    {
      arduino.analogWrite(ledPinWhiteEight, 0);
      arduino.analogWrite(ledPinWhiteNine, 255);
    }
    if (count >= 1100 && count <= 1199)
    {
      arduino.analogWrite(ledPinWhiteNine, 0);
    }
    if (count >= 1200)
    {
      count = 0;
      scatterOn = 0;
    }
  } else if (r == 2)
  {
    count = count + scatterSpeed;
    if (count >= 100 && count <= 199)
    {
      arduino.analogWrite(ledPinWhiteFour, 255);
    }
    if (count >= 200 && count <= 299)
    {
      arduino.analogWrite(ledPinWhiteFour, 0); 
      arduino.analogWrite(ledPinWhiteTwo, 255);
    }
    if (count >= 300 && count <= 399)
    {
      arduino.analogWrite(ledPinWhiteTwo, 0); 
      arduino.analogWrite(ledPinWhiteNine, 255);
    }
    if (count >= 400 && count <= 499)
    {
      arduino.analogWrite(ledPinWhiteNine, 0);
      arduino.analogWrite(ledPinWhiteSeven, 255);
    }
    if (count >= 500 && count <= 599)
    {
      arduino.analogWrite(ledPinWhiteSeven, 0);
      arduino.analogWrite(ledPinWhiteFive, 255);
    }
    if (count >= 600 && count <= 699)
    {
      arduino.analogWrite(ledPinWhiteFive, 0);
      arduino.analogWrite(ledPinWhiteOne, 255);
    }
    arduino.analogWrite(ledPinWhiteOne, 0);
    arduino.analogWrite(ledPinWhiteSix, 255);
    if (count >= 700 && count <= 799)
    {
      arduino.analogWrite(ledPinWhiteSix, 0);
      arduino.analogWrite(ledPinWhiteEight, 255);
    }
    if (count >= 800 && count <= 899)
    {
      arduino.analogWrite(ledPinWhiteEight, 0);
      arduino.analogWrite(ledPinWhiteThree, 255);
    }
    if (count >= 900 && count <= 999)
    {
      arduino.analogWrite(ledPinWhiteThree, 0);
    }
    if (count >= 1000)
    {
      count = 0;
      scatterOn = 0;
    }
  } else if (r == 3)
  {
    count = count + scatterSpeed;
    if (count >= 100 && count <= 199)
    {
      arduino.analogWrite(ledPinWhiteSix, 255);
    }
    if (count >= 200 && count <= 299)
    {
      arduino.analogWrite(ledPinWhiteSix, 0); 
      arduino.analogWrite(ledPinWhiteTwo, 255);
    }
    if (count >= 300 && count <= 399)
    {
      arduino.analogWrite(ledPinWhiteTwo, 0); 
      arduino.analogWrite(ledPinWhiteEight, 255);
    }
    if (count >= 400 && count <= 499)
    {
      arduino.analogWrite(ledPinWhiteEight, 0);
      arduino.analogWrite(ledPinWhiteFour, 255);
    }
    if (count >= 500 && count <= 599)
    {
      arduino.analogWrite(ledPinWhiteFour, 0);
      arduino.analogWrite(ledPinWhiteOne, 255);
    }
    if (count >= 600 && count <= 699)
    {
      arduino.analogWrite(ledPinWhiteOne, 0);
      arduino.analogWrite(ledPinWhiteThree, 255);
    }
    arduino.analogWrite(ledPinWhiteThree, 0);
    arduino.analogWrite(ledPinWhiteNine, 255);
    if (count >= 700 && count <= 799)
    {
      arduino.analogWrite(ledPinWhiteNine, 0);
      arduino.analogWrite(ledPinWhiteSeven, 255);
    }
    if (count >= 800 && count <= 899)
    {
      arduino.analogWrite(ledPinWhiteSeven, 0);
      arduino.analogWrite(ledPinWhiteFive, 255);
    }
    if (count >= 900 && count <= 999)
    {
      arduino.analogWrite(ledPinWhiteFive, 0);
    }
    if (count >= 1000)
    {
      count = 0;
      scatterOn = 0;
    }
  }
}