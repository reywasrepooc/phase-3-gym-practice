# Gym Membership Relations

For this assignment, we'll be working with an e-commerce domain. We'll be
focusing on the gym memberships.

We have three models: `Member`, `Membership`, and `Gym`.

For our purposes, a `Gym` has many `Member`s, a `Member` has many `Gym`s,
and a `Membership` belongs to a `Member` and to a `Gym`.

`Gym` - `Member` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Remember to identify a single source of truth for your data.

## Topics

- Active Record Migrations
- Active Record Associations
- Class and Instance Methods
- Active Record Querying

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

**Before you submit!** Save and run your code to verify that it works as you
expect. If you have any methods that are not working yet, feel free to leave
comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `Member` and `Gym`
models, and seed data for some `Member`s and `Gym`s. The schema currently
looks like this:

#### members Table

| Column | Type   |
| ------ | ------ |
| name   | String |

#### gyms Table

| Column | Type    |
| ------ | ------- |
| name   | String  |
| price  | Integer |
| rating | Integer |

You will need to create the migration for the `memberships` table using the
attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record give your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `memberships` table.

- A `Membership` belongs to a `Gym`, and a `Membership` also belongs to a `Member`. In
  your migration, create any columns your `memberships` table will need to establish
  these relationships.
- The `memberships` table should also have:
  - A `start_year` column that stores an integer.
  - A `start_month` column that stores a string.

After creating and running your migration, create your `Membership` class, and use
the `seeds.rb` file to create `Membership` instances so you can test your code.

**Once you've set up your `memberships` table**, work on building out the following
deliverables.

### Object Association Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Membership

- `Membership#member`
  - returns the `Member` instance for this Membership
- `Membership#gym`
  - returns the `Gym` instance for this Membership

#### Gym

- `Gym#memberships`
  - returns a collection of all the Memberships for the Gym
- `Gym#members`
  - returns a collection of all the Members who membershiped the Gym

#### Member

- `Member#memberships`
  - returns a collection of all the Memberships that the Member has given
- `Member#gyms`
  - returns a collection of all the Gyms that the Member has membershiped

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `Member.first.gyms` and see a list of the
gyms for the first member in the database based on your seed data; and
`Membership.first.member` should return the member for the first membership in the database.

### Aggregate and Association Methods

#### Membership

- `Membership#print_membership`
  - should `puts` to the terminal a string formatted as follows: `Membership for {insert member name} at {insert gym name} Start Date: {insert membership start_month} {insert membership start_year}`

#### Gym

- `Gym#join_gym(member, start_year, start_month)`
  - takes a `Member` (an instance of the `Member` class), a `start_year` (integer), and a `start_month` (string) as arguments, and creates a new `Membership` in the database associated with this Gym and the Member
- `Gym#print_all_memberships`
  - should `puts` to the terminal a string representing each membership for this gym
  - each membership should be formatted as follows: `Membership for {insert member name} at {insert gym name} Start Date: {insert membership start_month} {insert membership start_year}`
- `Gym#first_member`
  - returns a `Member` instance representing the Member with the earliest start year (month doesn't matter)
- `Gym.best_value`
  - returns a `Gym` instance that has the highest star_rating to price ratio. (5 star 100$ gym has a lower value than a 3 star 50$ gym)

#### Member

- `Member#latest_gym`
  - returns the gym instance that has the latest start year (month doesn't matter)
- `Member#remove_membership(gym)`
  - takes a `Gym` (an instance of the `Gym` class) and removes the member's membership for that gym
  - you will have to delete the row from the `memberships` table associated with this member and the gym
