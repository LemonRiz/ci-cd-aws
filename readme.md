# CI CD Jenkins -> AWS

​
Give a brief overview of the project.
​

## Demo

​
Research how you can create Gifs from screen recordings, demo the following:
​

- CI
  - Make a change to the project on your feature branch -> push changes to repo
  - Show pipeline running in Jenkins -> Show main branch has been updated
    ![Recording](ShowsUpdatedRepos.gif)
- CD
  - Make a change to the project on your feature branch -> push changes to repo
  - Show pipeline running in Jenkins -> Show ci pipeline triggers build pipeline
  - Show updated instance
    ​
    ![Recording2](Recording%202023-01-25%20at%2015.30.19.gif)

​

---

​

## How have you used Jenkins to add Continuous integration with this project?

I added continuous integration by building a test environment in Jenkins to test the build whenever changes are made. This means that if any errors occur, the build test will stop the errored changes being pushed to the main branch.
​

### How did you allow Jenkins access to the Github repo?

I set up a new item on Jenkins with the Github project settings enabled, and provided the SSH project URL.
​

### How did you get the Github repo to trigger the build?

I added the option on Jenkins to allow Github source code management using a private SSH key.
Then I implemented a github webhook and provided the Jenkins URL. Whenever events occured on Jenkins (Pull/Push/Merge etc) this would trigger a new build.

## ​

​

## How have you used Jenkins to add Continuous delivery with this project?
Jenkins added continuous delivery using the shell commands which build the webpage for deployment.

​

### How did you allow Jenkins access to the EC2 instance?
On EC2 I selected my instance and changed it's security groups. I added the "jenkinsdeployment" security group option.
I enabled the SSH agent in the Jenkins Build Environment and added our private key for AWS to jenkins, allowing Jenkins to access the ubuntu VM.

I also added the EC2 public IP to the nology-proxy.conf file as the server name. 


### How did you get the CI project to trigger the CD build?
When a test build was successful on CI, a postbuild action to build other projects on Jenkins would occur, and build the CD project. If the build is stable, this pushes the changes made on the feature-branch and merges them with main branch. The main branch is deployed and accessible to an end user with the EC2 public IP.
## ​
