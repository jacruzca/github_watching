# GithubWatching

## Tasks

- [x] Initial Phoenix project
- [x] Keep GitHub API Key in an environment variable and read it from mix config.
- [x] Create a separate module called `github_api` to interact with the GitHub API
- [x] Connect to the GitHub API using GraphQL
- [x] Domain modeling using structs
- [x] Paginate results retrieved from the API
- [x] Provide a way to test `github_api` without hitting the actual GitHub API. (use this: [Elixir Test Mocking with Mox](https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f))
- [x] Create a page for taking a GitHub username and display a list of watching repos
- [x] Each retrieved repo should redirect to its GitHub location
- [x] Bonus: Display starred repos
- [x] Bonus: Display more info about the user
- [x] Bonus: Deploy to Heroku

## How to run it

Make sure you set the following environment variable in your system: `GITHUB_WATCHING_KEY`. Its value must be the GitHub API key with appropriate scopes.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start the Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Testing it

Run:
  - `mix test`

## Demo

Go here: [`https://polar-ravine-36455.herokuapp.com/`](https://polar-ravine-36455.herokuapp.com/)

## Problems and lessons

The following is the list of problems I've found developing this:

- I still struggle creating specs. I don't understand some errors that ElixirLS Dialyzer throws. I don't know if it's my code or VSCode tooling.
- I learned how to mock modules for testing. It was easier than I thought using `mox`.

---

## Updated Dependencies

- Updated `minimist` from 1.2.0 to 1.2.8
  - [Release notes](https://github.com/minimistjs/minimist/releases)
  - [Changelog](https://github.com/minimistjs/minimist/blob/main/CHANGELOG.md)
  - [Commits](https://github.com/minimistjs/minimist/compare/v1.2.0...v1.2.8)

- Updated `mkdirp` from 0.5.1 to 0.5.6
  - [Release notes](https://github.com/isaacs/node-mkdirp/releases)
  - [Changelog](https://github.com/isaacs/node-mkdirp/blob/main/CHANGELOG.md)
  - [Commits](https://github.com/isaacs/node-mkdirp/compare/0.5.1...v0.5.6)

- Updated `glob-all` from 3.1.0 to 3.3.1
  - [Release notes](https://github.com/jpillora/node-glob-all/releases)
  - [Commits](https://github.com/jpillora/node-glob-all/commits/v3.3.1)

---

Signed-off-by: dependabot[bot] <support@github.com>