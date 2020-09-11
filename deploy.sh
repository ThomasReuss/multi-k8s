docker build -t thomasreuss/multi-client:latest -t thomasreuss/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t thomasreuss/multi-server:latest -t thomasreuss/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t thomasreuss/multi-worker:latest -t thomasreuss/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push thomasreuss/multi-client:latest
docker push thomasreuss/multi-server:latest
docker push thomasreuss/multi-worker:latest

docker push thomasreuss/multi-client:$SHA
docker push thomasreuss/multi-server:$SHA
docker push thomasreuss/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=thomasreuss/multi-server:$SHA
kubectl set image deployments/client-deployment client=thomasreuss/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=thomasreuss/multi-worker:$SHA
