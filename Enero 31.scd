b=Pbind(\note,Pseq([0,1,2,3]), \dur, 0.3)
b.play;

Pdef (\ula, Pseq([0,2,4,7],inf))
Pdef (\ula, Pseq([0,2,5,7],10))
c=Pbind(\note, Pdef(\ula),\dur, Pseq([0.2,0.2,0.2,0.2],inf))
c.play;
c.stop;
	