# ConcurrencyMeetup

## Installation

This assumes you already have elixir installed

```bash
https://github.com/CJPoll/concurrency_fundamentals_meetup;
cd concurrency_fundamentals_meetup;

mix deps.get;
mix compile;

mix test;
```

## Usage

There are preexisting tests in `test/concurrency_meetup_test.exs`. Modify
`lib/concurrency_meetup.ex` to make the tests pass one by one.

All tests are initially skipped. Remove the `@tag :skip` above a test to have
the test run when you do `mix test`.
