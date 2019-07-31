.PHONY: deps clean build

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world
	
build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world

package:
	sam package --template-file sam-app/template.yaml --output-template-file sam-app/output-template.yaml --s3-bucket template-store --profile mom0tomo

deploy:
	sam deploy --template-file sam-app/output-template.yaml --stack-name go-lambda --capabilities CAPABILITY_IAM --profile mom0tomo
