# R-Project Packages

This is a proof of concept of an app that indexes packages from http://cran.r-project.org/src/contrib/

To run, set up the database:
```
rails db:setup
```
Create an index:

```
rake index:create
```
Start the server:
```
rails s
```
Go to http://localhost:3000/packages/

To refresh the index, set up a cron job to run this task:

```
rake index:refresh
```
