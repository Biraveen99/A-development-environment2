ACIT4430 - Project 1

The following is a list of projects available as project 1 in ACIT4430. Each group will ONLY CHOSE ONE of these projects. Please remember to adhere to the instructions which are relevant for all projects.

Completing the project constitutes:

-  Defining and documenting a workflow for all operations involved in deploying a environment of the kind in question

-  Setting up a deployment environment in order to receive deployment requests relative to one of the four alternatives below

-  Completing at least three requests for an environment of the kind you decided on. For example, if you choose alternative 1: a developer environment, you have to deploy that environment three times.

-  Conducting an experiment where two students will attempt to deploy the environment based on your workflow

-  Writing and submitting a report, documenting the deployment environment as well as the result from completing requests and in line with the instructions below

- Conducting peer assessment and provide feedback on two student reports
General report and submission instructions

-  The report should not exceed 12 pages, but no strict penalty will be enforced if it does

-  The report is to be submitted as a PDF from your io-group in the hand-in folder in this canvas platform

-  Also submit the report in your trello.com board as an attachment to a card/wip called «Project 1»

-  Don’t forget: the dates will be visible as part of the wip’s history, so we will see when it was

submitted

  -  All reports should contain the two following sections:

Workflow design
How the workflow is mapped in kanban and its justification
As part of the workflow is a technical documentation of the operations. This should be on a level of detail so that a junior can repeat the steps. (This means you can assume some familiarity with OpenStack, Terraform, puppet etc.)
Workflow test
The workflow is tested by simulating it three times from start to finish.
A critical reflection on how the plan worked out in retrospect. What worked well and what could be improved upon?
Looking at the time history of the wip’s belonging to this project, what was the average time for a complete environment deployment?
Experiment results.
The result from when two different users attempted to complete the same workflow.
Remember that the workflow means the set of operations that go into deploying the environment, not setting up your infrastructure. It should be a guide for a junior sysadmin to follow if they would complete the task for you.
Technical instructions

Whenever one of the environment asks you to install a service, it is enough to install the packages. No need to set them up or configure them further unless directly instructed.

We assume to find proof of each of the following in the report

-  All deployed servers are to be controlled by a central configuration management system

-  All deployed servers should allow key-based login from your master server

-  One should strive to make as much as possible of the deployment managed by the configuration management system. If some elements are not controlled, it should be pointed out in the report.

Experiment instructions

In a group of two students, you will find another group with two students and ask them to complete a deployment in your infrastructure. The case is that they are newly employed sysadmins and are given a task by you to deploy an environment.

Their task is NOT to create a new infrastructure (master, puppet, ansible etc) but to use what you have created by following your documentation. Each of the group members will conduct the experiment once for one of the other group members, so that a total of two deployments have taken place and that both group members have tried to be the senior sysadmin.

The experiment will have the following structure:

The junior is handed the task and documentation. They will find the task as a WIP in your trello board (you have to add them). Mark down the time as «START».

The senior will observe as the junior attempts to complete the task. The senior will count every time a question is asked by the junior. The senior will of course help, but NOT by taking over the keyboard of the junior. Imagine they are in two different locations and will have to find other means to collaborate. The number of questions is recorded as «PREDEPLOY_QUESTIONS».

When the actual deploy has started, the junior will let the senior know and this is recorded as the «DEPLOY_START» time.

If there are any questions during the deployment, this will be dealt with in the same way as before, but recorded as «DEPLOY_QUESTIONS»

Once the deploy has been verified as working, the time is recorded as «DEPLOY_STOP»

A short commentary is added at the end where the results are discussed and compared to your

own tests from before.

Alternative 1 - A development environment

A development project is about to start programming. They ask you to deploy a development environment for them. They have the following requirements:

-  Two storage servers with the GlusterFS server installed, each with a single CPU.

-  Two servers the developers will use to write code on, each with a single CPU. They have to have emacs, jed and git installed

-  All machines have to have four users with preferred usernames:

- bob - janet - alice - tim

-  All four users should get root access via sudo

-  Tim and janet have to be members of the group «developers». That group has to be created.

-  Two compile servers with gcc, make and binutils installed

-  One server running Docker for testing the software developed

-  You don’t have to configure the GlusterFS and Docker services, the project members will do that themselves. Just install the packages.
