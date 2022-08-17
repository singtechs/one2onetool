# one2onetool

# Setup Jenkins on EC2
1. Create an EC2 instance
2. Install Git, Docker, JDK1.8

# Running Docker in Jenkins
1. Add jenkins user into docker group
`sudo gpasswd -a jenkins docker`
2. Restart deamon, docker and jenkins
- `systemctl daemon-reload`
- `systemctl restart docker`
- `sudo service jenkins restart`

# Bind github to jenkins
1. Generate token in github by going into `settings`>`developer settings`>`Personal Access Token`
2. Paste the token into jenkins `Manage Configuration`>`Git Hub`

# Resolving dependencies conflict when running jest in CI
 1. Add the following into package.json to ignore duplicated dependecies
```
  "jest": {
    "verbose": true,
    "modulePathIgnorePatterns": [
      "npm-cache",
      ".npm"
    ]
  }
```

# References

## Manual ECS Deployment
https://www.freecodecamp.org/news/how-to-deploy-a-node-js-application-to-amazon-web-services-using-docker-81c2a2d7225b/


## Scripted ECS Deployment
https://aws.amazon.com/blogs/devops/set-up-a-build-pipeline-with-jenkins-and-amazon-ecs/


# Sending with gmail as smtp
Need to set gmail account to allow "Less secure app access"