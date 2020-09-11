docker run -it -v $(pwd):/app ruby:2.4 sh
>> cd app
>> gem install travis
>> travis login --org
>> travis encrypt-file service-account.json -r ThomasReuss/multi-k8s --org
