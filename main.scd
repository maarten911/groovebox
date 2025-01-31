// Boot the audio server (if not already running)
s.options.numBuffers = 1024; // Optimize for Raspberry Pi
s.options.memSize = 8192;
s.options.maxNodes = 1024;
s.options.sampleRate = 44100;
s.options.device = "default"; // Use ALSA audio output
s.boot;

// Wait until server is running
s.sync;

// Print message
"SuperCollider OSC Listener is Active!".postln;

// Define a simple synth
SynthDef(\beep, {
    arg freq=440, amp=0.5;
    var sound = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.perc, doneAction: 2);
    Out.ar(0, sound);
}).add;

// OSC Listener for "/playSound"
OSCdef(\triggerSound, { |msg|
    var freq = msg[1].asFloat;  // Read frequency from Python
    if (freq == 0, { freq = 440 });  // Default frequency
    Synth(\beep, [\freq, freq]);  // Play sound
    ("Received OSC! Playing: " + freq + "Hz").postln;
}, '/playSound');

// Keep running
thisProcess.openUDPPort(57120); // Ensure OSC port is open
"Listening for OSC on port 57120...".postln;