dependencies:
	pip3 install pipreqs
	python3 -m pipreqs.pipreqs src --force --savepath requirements.txt

envs:
	python3 -m venv flask_venv
	. flask_venv/bin/activate

install:
	pip3 install -r requirements.txt
	
run:
	python3 src/app.py
