## What is "brick"

A brick to create a brick.

The created brick will be added to mason.yaml.

## Background of creation

It was created to make it easier to create bricks.

In this project, brick-related files and folders are placed under tools/bricks/.

If we were to create bricks with this in mind, the commands would be redundant, as shown below.

- `mason new [brick name] -o ./tools/bricks`
- `mason add [brick name] --path ./tools/bricks/[brick name]`

To eliminate this redundancy, we created a brick to create bricks.

## How to use

Exec below command.

- `mason make brick`

You will then be asked the following three questions at the prompt.

1. What is brick name?
2. Are you need hooks?
3. What is brick description?

By answering the above questions, a brick will be created that matches the answers.

As a point of caution, it is not necessary to answer all questions, as default values are set for each.

Also, by specifying the following options when executing mason make, you can create a brick without being asked at the prompt.

- `mason make brick --name [brick name] --hooks [true or false] --description [brick description]`
