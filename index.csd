<CsoundSynthesizer>

<CsOptions>

-iadc
-odac
-Ma

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


#define parameters #

iBeat = abs ( p3 )

STrack strget p4
SNote strget p5
iLength strlen SNote

iNumber init 0

if iLength > 0 then

iNumber ntom SNote

else

iNumber = p4

midinoteonkey iNumber, 0

endif

STuning sprintf "tuning/%d", iNumber % 12
iDetune chnget STuning

iStep chnget "tuning/key"

iFrequency = cpsmidinn ( int ( iNumber ) ) * cent ( iDetune + iStep * 100 )

iAmplitude = p6

#

#define mix #

STrack strget p4

prints "track: %s\n", STrack

chnmix aNote, STrack

#

#include "orc/index.part"

</CsInstruments>

<CsScore>

#define tuning #i "tuning" 0 0#

#include "sco/index.part"

</CsScore>

</CsoundSynthesizer>
