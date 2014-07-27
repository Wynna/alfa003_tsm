#include "acr_xp_i"

void main() {

object oPC = GetLastUsedBy();

ACR_GiveXPToPC(oPC, 1000);

}