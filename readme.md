### Raspberry

Set up python env with `python -m venv venv --system-site-packages`. We need the system site packages argument, to access the pi hardware, via the global python env, which is set up to communicate with its pins.

How to run 
- In one terminal, run `sclang main.scd`
- In another terminal, enter the venv, listen to presses with `python main.py`. Communication via OSC.

