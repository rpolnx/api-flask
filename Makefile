deps:
	pip3 install pipreqs
	python3 -m venv .env
	python3 -m  pipreqs.pipreqs src --force --savepath requirements.txt

envs:
	. .env/bin/activate

install:
	pip3 install -r requirements.txt
	
run:
	flask --app=src/app run --host=0.0.0.0 --port=8080
