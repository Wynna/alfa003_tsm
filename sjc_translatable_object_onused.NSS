 #include "acr_language_i"
void main() {
      object oPlaceable = OBJECT_SELF;
      object oUser = GetLastUsedBy();
      if(ACR_IsLanguageKnown(oUser, GetLocalString(oPlaceable, "SJC_PLC_LANG"))) 
	 	 {
           SendMessageToPC( oUser, GetLocalString( oPlaceable, "SJC_TRANSLATED_TEXT" ) );
      	} 
	  else 
	  	{
           SendMessageToPC( oUser, GetLocalString( oPlaceable, "SJC_FAILED_TEXT" ) );
     	 }
 }