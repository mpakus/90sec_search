# 90 seconds search

Using the attached files write a simple command line application in
Ruby to search the data and return the results in a human readable
format. Feel free to use libraries or roll your own code as you see
fit. Where the data exists, values from any related entities should
be included in the results. The user should be able to search on
any field, and full value matching is fine (e.g. “proj” won’t
return “project”). Search can get pretty complicated pretty easily,
we just want to see how you code a Ruby application.

## Install

```
bundle install
```

## Examples
```
./search -s zh-cn
./search -s "first proj"
./search --string=Springvil
./search --string="with HP"
```

## Tests
```
bundle exec rspec
```
 