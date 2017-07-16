// 'inc_barks'
string GetBark(string barktype = "")
{
    if (barktype == "")
    {
        return "hi";
    }

    if (barktype == "forest")
    {
        switch (Random(3))
        {
            case 0: return "Beware there's a brigand camp in the northeast.";
            case 1: return "Tra-la-la";
            case 2:
                if (GetIsDawn() || GetIsDay())
                    return "It feels nice in the forest today.";

                return "Watch out for the werewolves. The moon is full.";
        }
    }

    if (barktype == "silvy")
    {
        switch (Random(6))
        {
            case 0: return "Have I seen you before?";
            case 1: return "You don't look familiar...";
			case 2: return "Have you heard the latest?";
			case 3: return "I heard there were ghosts at Wendovercrypts";
			case 4: return "Ghosts? Really  I heard they were vampires";
			case 5: return "I heard they were looking for a bit of help over at the Fochlucan";
        }
    }

    if (barktype == "bandofbrothers")
    {
        switch (Random(5))
        {
            case 0: return "Look out for the Tiger!";
            case 1: return "eh whot?";
            case 2: return "Incoming!!!";
            case 3: return "Adolf my arse.";
            case 4: return "It's a long way to Tipperary.";
        }
    }

    if (barktype == "elfband")
    {
        switch (Random(2))
        {
            case 0: return "Love those ears!!";
            case 1:
            {
                string bark = "Have you seen Galadriel's new gown??";
                switch (GetGender(OBJECT_SELF))
                {
                    case GENDER_FEMALE: return bark += " oh my.";
                    case GENDER_MALE:   return bark += " oh yes.";
                    default:            return bark;
                }
            }
        }
    }

    if (barktype == "dwarfband")
    {
        switch (Random(4))
        {
            case 0: return "Harumph.";
            case 1: return "I didn't get a <i>Harumph</i> outta that guy!";
            case 2: return "Harumph.";
            case 3: return "";
        }
    }
}
