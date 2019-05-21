# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: [Trello](https://trello.com/b/mEsYmCtH/acebook-mvp)

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```


# Database initial set up log

We observed that the posts table had already been made (despite not having a user id column).

### Add the Users table
Create the migrate file:
```
$ bin/rails generate model Users email:string name:string password:string
```

Notes:

1. We are used to using varchar for emails/passwords etc, but ‘string is the universal term for this datatype (we speculate).
2. Timestamps ( created_at and updated_at) are created by default.

Run migrate to update the database:

```
 $ bin/rails db:migrate
```

## Updating our posts table by adding foreign (user) key:

### Update the Posts Table to introduce foreign key ( Users.id)

Note: we can’t manually change the /schema.rb file
How to update existing table with foreign key guide:

Reference: [Add a reference column migration in Rails 4 - Stack Overflow](https://stackoverflow.com/questions/22815009/add-a-reference-column-migration-in-rails-4)

Then,

```$ rails g migration AddUserToUploads user:references
$ bin/rails db:migrate ```
