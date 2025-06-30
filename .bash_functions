installflow () {
    yarn add --dev babel-cli babel-core babel-eslint babel-plugin-transform-remove-console babel-preset-flow eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-flow eslint-plugin-flowtype eslint-plugin-import eslint-plugin-prettier flow-bin babel-plugin-transform-runtime babel-preset-env
    cp ~/.config/skeletons/.eslintrc.json ./
    cp ~/.config/skeletons/.babelrc ./
    cp ~/.config/skeletons/.flowconfig ./
    yarn run flow
}
djangoToECR () {
    aws ecr get-login-password --region ca-central-1 --profile airm > p.txt
        docker login --username AWS --password $(cat p.txt) 408111643902.dkr.ecr.ca-central-1.amazonaws.com

        docker tag agi3_app_local_docs:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_docs:latest
        docker tag agi3_app_local_node:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_node:latest
        docker tag agi3_app_local_django:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_django:latest
        docker tag agi3_app_local_flower:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_flower:latest
        docker tag agi3_app_local_celerybeat:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_celerybeat:latest
        docker tag agi3_app_local_celeryworker:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_celeryworker:latest
        docker tag agi3_app_production_postgres:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_production_postgres:latest

        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_docs:latest
        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_node:latest
        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_django:latest
        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_flower:latest
        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_celerybeat:latest
        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_local_celeryworker:latest
        docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3_app_production_postgres:latest
}
pushToECR () {
    aws ecr get-login-password --region ca-central-1 --profile airm > p.txt
    docker login --username AWS --password $(cat p.txt) 408111643902.dkr.ecr.ca-central-1.amazonaws.com

    d=$(pwd)

    cd ~/projects/server/webhooks
    docker build -t webhooks .

    cd ~/projects/server/upload_server
    docker build -t upload_server .

    cd ~/projects/server/download_server
    docker build -t download_server .


    cd ~/projects/server/agi3
    docker build -t agi3 .
    cd $d

    docker tag agi3:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3:latest
    docker tag nginx:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/nginx:latest
    docker tag hasura/graphql-engine:v1.3.3.cli-migrations-v2 408111643902.dkr.ecr.ca-central-1.amazonaws.com/hasura:latest
    docker tag webhooks:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/webhooks:latest
    docker tag download_server:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/download_server:latest
    docker tag upload_server:latest 408111643902.dkr.ecr.ca-central-1.amazonaws.com/upload_server:latest
    docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/agi3:latest
    docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/upload_server:latest
    docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/webhooks:latest
    docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/download_server:latest

    docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/hasura:latest

    docker push 408111643902.dkr.ecr.ca-central-1.amazonaws.com/nginx:latest
}

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

bf () {
    npm run build:dev
cp dist/* ../server/proxy/html/
}
new_func () {
    echo 1
echo 2
echo 3
echo 4
}
searchJIRA () {
    curl --request POST  --url 'https://airm.atlassian.net/rest/api/3/search' \
         --user 'colin.ryan@airmconsulting.com:DfvWnIWgw1ssTCCCh6AJ550F' \
         --header 'Accept: application/json' \
         --header 'Content-Type: application/json' \
         --data '{ 
             "jql":"project = AW AND assignee = currentUser()" 
         }'
}
updateAgi3TestWhitelist () {

    
    secGroupId="sg-0fb9307322da6a1f9"
    if [ -z ${1//} ]; then
    echo "No user provided. Please pass in the name of a User"
    return
    fi 


    if [ -z ${2//} ]; then
    echo "No ip address provided. Please pass in the ip address of the user"
    return
    fi 

    secGroup=$(aws ec2 describe-security-group-rules --filter Name="group-id",Values=$secGroupId)
    secGroupRules=$(echo $secGroup | jq ."SecurityGroupRules")
    ruleId=$(echo $secGroupRules | ramda --js \
                                   "find(x => x.Description ==='$1')" \
                                   "ifElse(x=> not(equals(undefined, x)), prop('SecurityGroupRuleId'), x => 'NA' )")

    if [ $ruleId == "NA" ]; then
      echo "Couldn't find user $1"
    else
      didUpdate=$(aws ec2 modify-security-group-rules \
        --group-id $secGroupId \
        --security-group-rules \
        "SecurityGroupRuleId=$ruleId,SecurityGroupRule={Description='$1',IpProtocol=tcp,FromPort=443,ToPort=443,CidrIpv4=$2/32}")
      echo $didUpdate
    fi

}

getAgi3TestWhitelist () {


    secGroupId="sg-0fb9307322da6a1f9"


    secGroup=$(aws ec2 describe-security-group-rules --filter Name="group-id",Values=$secGroupId)
    secGroupRules=$(echo $secGroup | jq ."SecurityGroupRules")
    names=$(echo $secGroupRules | ramda --js \
                                  "map(x => x.Description )") 

    echo $names | jq
}

