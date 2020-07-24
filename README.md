
```shell script
gcloud init
gcloud auth application-default login
gcloud config set project [gcloud-project-id]
```


```shell script
cd env/dev/
# or cd env/qa/
# or cd env/staging/
# pr cd env/prod/

terraform plan
terraform apply
```