---
layout: post
title: "Efficient Jenkins pipelines"
date: 2017-05-19 15:42:00
---

I'm currently working with HM Courts and Tribunal Service on their programme to
reform the way the public Apply for Divorce. On that project we use [Jenkins]
and the excellent [Github Org folder][gof-plugin] plugin.

Over time as the Reform programme has grown, we have found that we often lock 
up Jenkins with many builds waiting in the Build Queue.

[![Image of a very long build queue]][build-queue]

In order to avoid the [tragedy of the commons] we need to use Jenkins as 
efficiently as possible. Here's some things we are doing.

(If you are reading this but aren't working on Reform, there's a chance this 
won't matter much to you. Publish, don't send.)

## Use Pull Request building

The org folder plugin has a setting that switches on Pull Request building.
Enabling this causes your jobs to build PR's instead of 

## Don't be greedy with nodes

## Kill old builds using Milestones and Locks


<!--

Switch to pull request building

We are probably all doing this atm but it's worth stating, if you have branch building turned on and you don't delete your old branches then they will sit there wasting valuable compute resource.

In ansible-management/group_vars/role_jenkins.yml you need to ensure your org has ​buildPullRequests: true​.

E.g.:
  - name: 'probate'
    displayName: 'Probate'
    description: 'The Apply for Probate team repos'
    buildPullRequests: true

Don't be greedy with nodes

We have only 5 executors on Jenkins. Which means only 5 jobs can concurrently build at a time. If we write our jobs to allocate more nodes than they need that number quickly fills up and we go down to 2 or 3 jobs at a time.

If you are running a downstream job do not allocate a node while you run that build, e.g.:

node {
  stage('build') {
    .. do some building
  }

  stage('deploy') {
    build 'deploy-ansible'
  }
}

​In this example, your job will allocate a node, then the Deploy Ansible job will allocate a node. While you wait for the deployment to finish you will sit on that first node, doing nothing and wasting a slot someone else could use.

Instead do this:

node {
  stage('build') {
    .. do some building
  }
}
stage('deploy') {
  build 'deploy-ansible'
}

Now your job will release it's node and wait for the deploy job in a "flyweight executor" which costs near nothing.


Kill your old builds with Milestones and Locks

Having multiple copies of the same build, say the latest on master of Divorce Frontend running at the same time is a waste of resources. You only really care about the most recent job.

In divorce frontend we are using the milestone and lock plugins to do this:

milestone()
node {
  lock(resource: 'divorce-frontend-${env.BRANCH_NAME}', inverse_precedence: true) {
    .. do some long running things
    milestone()
  }
}

The first milestone causes builds in the same job to stack up and wait, passing in the order of the build number. The lock ensures that only 1 job can do things inside it at a time, favouring the most recent jobs thanks to the inverse_precedence. When a job successfully finishes the body of the job it will hit the second milestone, and cause any jobs waiting at the previous milestone to be killed.

We've wrapped this in to a throttle helper that you can use: 

throttle('build') {
  node {
    ...
    compile, test, etc.
    ...
  }
}

-->



[Jenkins]: https://jenkins.io/
[gof-plugin]: https://github.com/jenkinsci/github-organization-folder-plugin
[build-queue]: /assets/build-queue.png
