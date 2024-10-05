docker-compose up
docker run --rm robotframework-test
docker run --rm -v ${pwd}/results:/robotframework/results robotframework-test
docker image prune
docker builder prune
docker volume prune
docker build -t robotframework-test .
docker network ls
docker network prune