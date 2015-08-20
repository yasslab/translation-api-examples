require 'gengo'
require 'json'
require 'pp'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     !!ENV['GENGO_USE_SANDBOX'],
)

STANDARD = 'standard'
PRO = 'pro'

def jobs_hash(body_srcs, tier)
  jobs = body_srcs.map {|body_src|
    {
      type: 'text',
      slug: "rails/rails@76c2f01",
      body_src: body_src,
      lc_src: 'en',
      lc_tgt: 'ja',
      tier: tier,
      auto_approve: 1,
    }
  }
  job_keys = (1..body_srcs.size).map {|n| "job#{n}" }
  job_keys.zip(jobs).to_h
end


# body_src source:
# https://github.com/rails/rails/commit/76c2f01fcb348cb92d0099389db1b4bae8d6d0c0

body_src1=<<SRC
Bob browses a message board and views a post from a hacker where there is a crafted HTML image element.
SRC

body_src2=<<SRC
The element references a command in Bob's project management application, rather than an image file: `<img src="http://www.webapp.com/project/1/destroy">`
SRC

body_src3=<<SRC
Bob's session at `www.webapp.com` is still alive, because he didn't log out a few minutes ago.
SRC

body_src4=<<SRC
By viewing the post, the browser finds an image tag.
SRC

body_src5=<<SRC
It tries to load the suspected image from `www.webapp.com`.
SRC

body_src6=<<SRC
As explained before, it will also send along the cookie with the valid session id.
SRC

body_src7=<<SRC
The web application at `www.webapp.com` verifies the user information in the corresponding session hash and destroys the project with the ID 1.
SRC

body_src8=<<SRC
It then returns a result page which is an unexpected result for the browser, so it will not display the image.
SRC

body_src9=<<SRC
_POST requests can be sent automatically, too_.
SRC

body_src10=<<SRC
Here is an example for a link which displays `www.harmless.com` as destination in the browser's status bar.
SRC

body_src11=<<SRC
In fact it dynamically creates a new form that sends a POST request.
SRC

body_srcs = (1..11).map {|n| eval("body_src#{n}") }

pp gengo.postTranslationJobs(jobs: jobs_hash(body_srcs, STANDARD))
pp gengo.postTranslationJobs(jobs: jobs_hash(body_srcs, PRO))

# body_src source:
# https://github.com/rails/rails/commit/8e94137a121031eda5fa0083b96cb9bc4b4f7aa2
body_src = <<SRC
Suppose that the `products` table was created using an SQL statement like:
SRC

pp gengo.postTranslationJobs(jobs: jobs_hash([body_src], STANDARD))
pp gengo.postTranslationJobs(jobs: jobs_hash([body_src], PRO))

# body_src source:
# https://github.com/rails/rails/commit/3822a322a82a19a9341a21a0cb1e36653da09c46

body_src=<<SRC
`config.action_view.automatically_disable_submit_tag` determines whether submit_tag should automatically disable on click, this defaults to true.
SRC

pp gengo.postTranslationJobs(jobs: jobs_hash([body_src], STANDARD))
pp gengo.postTranslationJobs(jobs: jobs_hash([body_src], PRO))

# body_src source:
# https://github.com/rails/rails/commit/f51d1428811ae53876f6e1f40ad2c64d200fd0f5
body_src1=<<SRC
In Rails, a resourceful route provides a mapping between HTTP verbs and URLs to controller actions.
SRC

body_src2=<<SRC
By convention, each action also maps to a specific CRUD
SRC

body_src3=<<SRC
You can override `ActiveRecord::Base#to_param` of a related model to construct an URL:
SRC

body_src4=<<SRC
However, since Rails 4, the default store is EncryptedCookieStore.
SRC

body_src5=<<SRC
With EncryptedCookieStore the session is encrypted before being stored in a cookie.
SRC

body_src6=<<SRC
This prevents the user from accessing and tampering the content of the cookie.
SRC

body_src7=<<SRC
Thus the session becomes a more secure place to store data.
SRC

body_src8=<<SRC
The encryption is done using a server-side secret key `secrets.secret_key_base` stored in `config/secrets.yml`.
SRC

body_srcs = (1..8).map {|n| eval("body_src#{n}") }
pp gengo.postTranslationJobs(jobs: jobs_hash(body_srcs.take(3), STANDARD))
pp gengo.postTranslationJobs(jobs: jobs_hash(body_srcs.take(3), PRO))
pp gengo.postTranslationJobs(jobs: jobs_hash(body_srcs.drop(3), STANDARD))
pp gengo.postTranslationJobs(jobs: jobs_hash(body_srcs.drop(3), PRO))
