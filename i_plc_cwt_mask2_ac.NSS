void main()
{

object oPC = GetLastUsedBy();
object oMask = GetObjectByTag("PLC_CWT_MASK2");

if (!GetIsPC(oPC)) return;

AssignCommand(oMask, ActionSpeakString("A little beef, four humps, one eye;"));

DelayCommand(2.0, AssignCommand(oMask, ActionSpeakString("Tail up front, one word, one try.")));

}