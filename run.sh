sudo SCSYNTH_NOGUI=1 QT_QPA_PLATFORM=offscreen sclang main.scd &

sleep 1

source venv/bin/activate

python main.py