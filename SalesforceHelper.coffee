request = require 'request'
Q = require 'q'
qs = require 'qs'

###

Salesforce.com OAuth access
@bugs aaylward@gmail.com <Andy Aylward>

###

tokenFromUsername = (options) ->

  loginServer = if options.env is 'prod' then 'login.salesforce.com' else 'test.salesforce.com'

  data =
    grant_type: 'password'
    client_id: options.key
    client_secret: options.secret
    username: options.username
    password: options.password

  url = "https://#{ loginServer }/services/oauth2/token?#{ qs.stringify data }"

  post = Q.denodeify request.post
  post url

exports = { tokenFromUsername }

module.exports = exports
