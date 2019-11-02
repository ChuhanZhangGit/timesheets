# Design 
Database contain one User table for all user that includes 2 user groups: 1. worker, 2. manager. 


Worker can only create timesheet.
Manager can view,delete and approve timesheet but can't edit timesheet.

<strong>Maximum of 8 hour work is checked. When user submit more 8 hours of work, the timesheet wouldn't be stored</strong>

Login infos:
Worker: bob@example.com password: 1
Worker: carol@example.com password: 1
Manager: test password: 1

# Database structure

## User
Columns
- group: string 
- email:string 
- name:string 
- manager_id: id

## Daysheet
This table track the timesheet the worker submitted.
Columns
- manager_id:references:users
- worker_id:references:users 
- date:date 
- approved:boolean

## Task
Columns
- daysheet_id:references:daysheets
- job_id:references:jobs 
- job_code:string 
- hours:float 
- note:string 
- worker_id:references:users

## Job
Columns
- jobcode:string 
- manager_id:references:users 
- budget:integer 
- name:string 
- description:string


# Timesheets


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
