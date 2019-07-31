.PHONY: deps clean build

deps:
	go get -u github.com/aws/aws-lambda-go/events
	go get -u github.com/aws/aws-lambda-go/lambda

clean: 
	rm -rf ./hello-world/hello-world
	
build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world

package:
	sam package --template-file template.yaml --output-template-file output-template.yaml --s3-bucket sam-template-mom0tomo --profile mom0tomo

deploy:
	sam deploy --template-file output-template.yaml --stack-name sam-template-mom0tomo --capabilities CAPABILITY_IAM --profile mom0tomo
