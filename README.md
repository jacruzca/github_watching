# GithubWatching

## Tasks

- [x] Initial Phoenix project
- [x] Keep GitHub API Key in an environment variable and read it from mix config.
- [x] Create a separate module called `github_api` to interact with GitHub API.
- [x] Connect to the GitHub API using GraphQL.
- [x] Domain modeling using structs.
- [x] Paginate results retrieved from the API.
- [x] Provide a way to test `github_api` without hitting the actual GitHub API. (Use this: [Elixir Test Mocking with Mox](https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f))
- [x] Create a page for taking a GitHub username and display a list of watching repos.
- [x] Each retrieved repo should redirect to its GitHub location.
- [x] Bonus: Display starred repos.
- [x] Bonus: Display more info about the user.
- [x] Bonus: Deploy to Heroku.

## How to run it

Make sure you set the following environment variable in your system: `GITHUB_WATCHING_KEY`. Its value must be the GitHub API key with appropriate scopes.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`.
  * Install Node.js dependencies with `cd assets && npm install`.
  * Start Phoenix endpoint with `mix phx.server`.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Testing it

Run:
  - `mix test`.

## Demo

Visit: [`https://polar-ravine-36455.herokuapp.com/`](https://polar-ravine-36455.herokuapp.com/).

## Problems and lessons

The following is a list of problems I've encountered while developing this project:

- I still struggle with creating specs. I'm unsure about some errors that ElixirLS Dialyzer throws. I'm not sure if it's my code or the VSCode tooling.
- I learned how to mock modules for testing, which was easier than I thought using `mox`.

Updated dependencies:
- `minimist` has been updated from 1.2.0 to 1.2.8 ([Changelog](https://github.com/minimistjs/minimist/blob/main/CHANGELOG.md)).
- `mkdirp` has been updated from 0.5.1 to 0.5.6 ([Changelog](https://github.com/isaacs/node-mkdirp/blob/main/CHANGELOG.md)).
- `glob-all` has been updated from 3.1.0 to 3.3.1 ([Commits](https://github.com/jpillora/node-glob-all/commits/v3.3.1)).

Signed-off-by: dependabot[bot] <support@github.com>