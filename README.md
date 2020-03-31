# Recipe Box

In this project, you will build the Data Access Layer to power a Web
application. This means that you will provide all of the SQL that it takes to
get data into and from the database. You will do this in SQL files that the
application will load and read.

**Note**: This is not a good way to create a database-backed application. This
project is structured this way so that it isolates the activity of SQL writing.
Do not use this project as a template for your future projects.

## The data model analysis

What goes into a recipe box? Why, recipes, of course! Here's an example recipe
card.

![Recipe card]

You can see that a recipe is made up of three basic parts:

* A title,
* A list of ingredients, and
* A list of instructions.

You're going to add a little more to that, too. It will also have

* The date/time that it was entered into the recipe box, and
* The date/time it was last updated in the recipe box.

These are good pieces of data to have so that you can show them "most recent"
for example.

Ingredients themselves are complex data types and need their own structure. They
"belong" to a recipe. That means they'll need to reference that recipe. That
means an ingredient is made up of:

* An amount (optional),
* A unit of measure (optional),
* The actual food stuff, and
* The id of the recipe that it belongs to.

That unit of measure is a good candidate for normalization, don't you think?
It's a predefined list of options that should not change and that you don't want
people just typing whatever they want in there, not if you want to maintain
data integrity. Otherwise, you'll end up with "C", "c", "cup", "CUP", "Cup", and
all the other permutations, each of which is a distinct value but means the same
thing.

Instructions are also complex objects, but not by looking at them. Initially,
one might only see text that comprises an instruction. But, very importantly,
instructions have _order_. They also _belong_ to the recipe. With that in mind,
an instruction is made up of:

* The text of the instruction,
* The order that it appears in the recipe, and
* The id of the recipe that it belongs to.

That is enough to make a good model for the recipe box.

![recipe box data model]

## Getting started

* Download the starter project from
  https://github.com/appacademy-starters/sql-recipe-box
* Run `npm install` to install the packages
* Run `npm start` to start the server on port 3000

You'll do all of your work in the **data-access-layer** directory. In there, you
will find a series of SQL files. In each, you will find instructions of what to
do to make the user interface to work. They are numbered in an implied order for
you to complete them. The only real requirement is that you finish the SQL for
the **00a-database.sql** and **00b-seed.sql** files first. That way, as you make
your way through the rest of the SQL files, the tables and some of the data will
already exist for you. You can run the command `npm run seed` to run both of
those files or pipe each it into `psql` as you've been doing.

Either way that you decide to seed the database, you'll need to stop your
server. The seed won't correctly run while the application maintains a
connection to the application database. You may also need to exit all of the
active `psql` instances that you have running to close out all of the active
connections. When you run the seed, if it reports that it can't do something
because of active connections, look for a running instance of the server,
Postbird, or `psql` with that connection.

**Warning**: running the seed files will destroy all data that you have in the
database.

## Your SQL

When you write the SQL, they will mostly be parameterized queries. The first
couple of files will show you how it needs to be done, where you will place the
parameter placeholders "$1", "$2", and so on. If you need to, refer to the
[Parameterized query] section of the documentation for **node-postgres**.

In each of the following files in the **data-access-layer**, you will find one
or more lines with the content `-- YOUR CODE HERE`. It is your job to write the
SQL statement described in the block above that code. Each file is named with
the intent of the SQL that it should contain.

## The application

The application is a standard [express.js] application using the [pug] library
to generate the HTML and the [node-postgres] library to connect to the database.

It reads your SQL files whenever it wants to make a database call. If your file
throws an error, then the UI handles it by telling you what needs to be fixed
so that the UI will work. The application will also output error messages for
missing functionality.

The SQL files contain a description of what the content is and where it's used
in the application. Tying those together, you'll know you're done when you have
all of the SQL files containing queries and there are no errors in the UI or
console.

[Recipe card]: https://appacademy-open-assets.s3-us-west-1.amazonaws.com/Module-SQL/assets/sql-recipe-card.jpeg
[express.js]: https://www.expressjs.com
[pug]: https://pugjs.org
[node-postgres]: https://node-postgres.com
[Parameterized query]: https://node-postgres.com/features/queries#Parameterized%20query
[recipe box data model]: https://appacademy-open-assets.s3-us-west-1.amazonaws.com/Module-SQL/assets/sql-recipe-box-data-model.png
