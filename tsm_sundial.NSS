void main()
{
object oUser = GetLastUsedBy();
if(!GetIsPC(oUser))
  {
  return;
  }
int nHour = GetTimeHour();
if(nHour > 12)
  {
  nHour = nHour - 12;
  }
string sHour = IntToString(nHour);
int nSecond = GetTimeSecond();
int nMinute = GetTimeMinute();
nSecond = nSecond/2;
if(nMinute)
  {
  nSecond = nSecond + 30;
  }
string sMinute = IntToString(nSecond);
if(nSecond < 10)
  {
  sMinute = "0" + sMinute;
  }
string sTime = sHour + ":" + sMinute;
string sDay = IntToString(GetCalendarDay());
int nMonth = GetCalendarMonth();
string sMonth;
string sYear = IntToString(GetCalendarYear());
switch(nMonth)
  {
  case 1:
    {
    sMonth = "Hammer";
    break;
    }
  case 2:
    {
    sMonth = "Alturiak";
    break;
    }
  case 3:
    {
    sMonth = "Ches";
    break;
    }
  case 4:
    {
    sMonth = "Tarsakh";
    break;
    }
  case 5:
    {
    sMonth = "Mirtul";
    break;
    }
  case 6:
    {
    sMonth = "Kythorn";
    break;
    }
  case 7:
    {
    sMonth = "Flamerule";
    break;
    }
  case 8:
    {
    sMonth = "Eleasis";
    break;
    }
  case 9:
    {
    sMonth = "Eleint";
    break;
    }
  case 10:
    {
    sMonth = "Marpenoth";
    break;
    }
  case 11:
    {
    sMonth = "Uktar";
    break;
    }
  case 12:
    {
    sMonth = "Nightal";
    break;
    }
  }
string sStringToSpeak = "It is " + sTime + " on " + sMonth + " " + sDay + ", " + sYear;
SpeakString(sStringToSpeak, TALKVOLUME_TALK);
return;
}