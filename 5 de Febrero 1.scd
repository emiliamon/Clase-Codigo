//Librería de sintes

//sine percusivo

(
SynthDef(\sine, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen=SinOsc.ar(freq,0,amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

//triangular percusivo

(
SynthDef(\triangulo, {arg freq=440, amp=1, pan=0, at=0.1, rel=0.5, out=0;
	var sign, paneo, env,mouse;
	mouse=MouseY.kr(0,0.25);
	sign=LFTri.ar(freq,0,mouse)*BrownNoise.kr(1)+SinOsc.ar(freq,0,mouse);
	paneo=Pan2.ar(sign, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

//cuadrada percusivo

(
SynthDef(\pulso, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sign, paneo, env;

	sign=Pulse.ar(freq,0.5,amp);
	paneo=Pan2.ar(sign, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

//diente de sierra percusivo

(
SynthDef(\sierra, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sign, paneo, env;

	sign=Saw.ar(freq,amp);
	paneo=Pan2.ar(sign, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

//ruido blaco percusivo

(
SynthDef(\ruido, {arg amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sign, paneo, env;

	sign=WhiteNoise.ar(amp);
	paneo=Pan2.ar(sign, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);


a=Synth(\triangulo,[\freq, 300, \amp, 0.7, \pan, 0.5, \at, 0.3, \rel, 1])

(
~sec=Pdef(\misecu,
	Pbind(\instrument, \triangulo,
	\dur, Prand([1/8,0.75,0.5,0.25], inf),
	\note, Prand([0,5,8,10], inf),
	\rel, 2,
	\octave, Prand([5,4,3,6],inf),
	\pan, Pwhite(-1.0,1.0,inf)
	)
)
)

(
~sec=Pdef(\misecu,
	Pbind(\instrument, \triangulo,
	\dur, Prand([1/8,0.75,0.5,0.25], inf),
	\note, Pseq([Pseq([0,5,8],2),Pseq([0,5,10],2)], inf),
	\rel, 2,
	\octave, Prand([5,4,3,6],inf),
	\pan, Pwhite(-1.0,1.0,inf)
	)
)
)

~sec.play;
~sec.stop;

b.play.quant_(4);

Platform.userExtensionDir
Platform.systemExtensionDir