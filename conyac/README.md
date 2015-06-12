Conyac API example
=================

Following [Conyac developer | スタートアップガイド](http://developer.conyac.cc/ja/v1/start/)

Usage
-----

### Register your application:

- サービスサイトURL: `http://localhost:3000/`
- OAuth コールバックURL: `http://localhost:3000/`

### Get code
```console
$ cat > .envrc
export CONYAC_APP_ID='YOUR GENGO API KEY'
export CONYAC_APP_SECRET='YOUR GENGO API PRIVATE KEY'

$ direnv allow
$ BUNDLE_GEMFILE=./Gemfile bundle install
$ open `BUNDLE_GEMFILE=./Gemfile bundle exec ruby get_authorize_code.rb`
```

click on `認証`

copy code in url

### Get access token

```
$ BUNDLE_GEMFILE=./Gemfile bundle exec ruby get_access_token.rb YOUR_CODE_HERE
{"access_token":"your access token here","token_type":"bearer"}
$ cat >> .envrc
export CONYAC_ACCESS_TOKEN='YOUR_ACCESS_TOKEN'
$ direnv allow
```
