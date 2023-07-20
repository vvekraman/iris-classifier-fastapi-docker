run_local:
	conda env create --file environment.yml
	CALL conda.bat activate iris_clf_env && uvicorn main:app

docker_init:
	echo "Creating the iris-clf docker image" 
	docker build -t iris-clf .
	echo "Connecting host port 8100 to port 80 of container" 
	docker run -p 8100:80 --name irisclf iris-clf
	echo "Make requests to http://localhost:8100/"

docker_run:
	echo "Make requests to http://localhost:8100/"
	docker start -a irisclf

docker_stop:
	docker stop irisclf