# GithubWatching

## Tasks

- [x] Initial Phoenix project
- [x] Keep GitHub API Key in a environment variable and read it from mix config.
- [x] Create separate module called `github_api` to interact with GitHub API
- [x] Connect to Github API using GraphQL
- [x] Domain modeling using structs
- [x] Paginate results retrieved from API
- [x] Provide a way to test `github_api` without hitting the actual github api. (use this: https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f)
- [ ] Create a page for taking a github username and display a list of watching repos
- [ ] Each retrieved repo should redirect to its github location
- [ ] Bonus: Deploy to Heroku

## How to run it

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Problems

The following is the list of problems I've found developing this:

- I still struggle creating specs. I don't understand some error that ElixirLS Dialyzer throws. I don't know if it's my code or VSCode tooling.