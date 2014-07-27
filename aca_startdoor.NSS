
void main() {

object oPC = GetLastUsedBy();
SendMessageToPC(oPC, "Using start area door");
AssignCommand(oPC, ActionStartConversation(oPC, "tsm_startarea", TRUE, FALSE));
}