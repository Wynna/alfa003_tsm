#include "acr_language_i"

int StartingConditional( string sLanguage ) {

return ( ACR_IsLanguageKnown( GetPCSpeaker(), sLanguage ) );
}