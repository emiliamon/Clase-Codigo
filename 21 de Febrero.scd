().play

f=Synth(\reverb)
f.set(\mix, 1, \room, 0.5)

(
Pdef(\efx, Pbind(\instrument, \saw,
	\dur, Pseq([0.4, 0.4, 0.8],inf),
	\amp, 0.3,
	\out, 11,
	\note, Pbrown (0, 12, Prand([3,4],inf), inf),
	\octave, 5,
	//\octave, Pseq([4,5,Pn(6,4)],inf),
	\pan, Pwhite(-1.0, 1.0, inf),
)
).play
)

