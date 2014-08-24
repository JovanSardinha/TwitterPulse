library(ROAuth)


requestURL = 'https://api.twitter.com/oauth/request_token'
accessURL = 'https://api.twitter.com/oauth/access_token'
authURL = 'https://api.twitter.com/oauth/authorize'

consumerKey<-'lS4pl4g0GwITQ1stn13rPRaeu'
consumerSecret<-'V1KHraJNsqiY0xIayRAq7kp4SAC2FdxKHqzyMOY4oG6fFpowdU'
my_oauth = OAuthFactory$new(consumerKey = consumerKey, consumerSecret = consumerSecret, 
                            requestURL = requestURL, accessURL = accessURL, authURL = authURL)
my_oauth$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl'))
save(my_oauth, file = 'my_oauth.RData')
