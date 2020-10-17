# terraform-localstack-docker-cli

## Starting localstack

```bash
docker-compose up
```

## Cleaning up

```bash
docker-compose down
```

## Apply terraform operations

`./tf` is a script provided to execute the terraform 0.13.4 CLI with the
specifications in the `./docker-compose.terraform.yml` file.  This way
terraform does not have to be installed locally on the machine.

```bash
# create the sample-bucket in S3
./tf apply
# destroy the bucket
./tf destroy
```

## Alternative: A bash function to run Terraform CLI

This function allows running the Terraform CLI in a docker container.  An
alternative/example if you don't want to run it using the `./tf` script.

```bash
function tf () {
  # grants access to host network and uses the current directory as
  # the working directory with read-write mode
  docker run \
    --interactive \
    --tty \
    --network host \
    --volume "$(pwd):/tf:rw" \
    --workdir '/tf' \
    hashicorp/terraform:light \
    "$@"
}
```

## Query S3 locally using AWS CLI

This assumes `docker-compose up` has already been run.

```bash
export AWS_ACCESS_KEY_ID=mock
export AWS_SECRET_ACCESS_KEY=mock
export AWS_REGION=us-east-1

aws --endpoint-url 'http://localhost:4566' s3api list-buckets
aws --endpoint-url 'http://localhost:4566' s3 ls
```
