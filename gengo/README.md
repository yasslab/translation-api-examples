Gengo API example
=================

Following [First steps](http://developers.gengo.com/v2/first_steps/) in Ruby.
Tested in Ruby 2.2.2.

Usage
-----

```console
$ cat > .envrc
export GENGO_PUBLIC_KEY='YOUR GENGO API KEY'
export GENGO_PRIVATE_KEY='YOUR GENGO API PRIVATE KEY'

$ direnv allow
$ BUNDLE_GEMFILE=./Gemfile bundle install
$ BUNDLE_GEMFILE=./Gemfile bundle exec ruby 〜.rb
```
