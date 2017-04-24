require "aws-sdk"
require 'openssl'
require "hmac-sha2"
require "cgi"
require 'time'
require 'net/https'
require 'base64'

$AWS_ID='AKIAJOQLSMLJD54DEQ2A'
$AWS_KEY='xG+nXx7hhOZcmTu3dyGjDfhA8cLY2Kpbnz+zrFqq'
$SNS_ENDPOINT='sns.us-west-2.amazonaws.com'

def url_encode(string)
  # don't encode: ~_-, spaces must me %20
  CGI.escape(string.to_s).gsub("%7E", "~").gsub("+", "%20")
end

def canonical_query_string(params)
  #sort params by byte order
  params.keys.sort.collect {|key|  [url_encode(key), url_encode(params[key])].join("=") }.join("&")
end

def sign_request(params)
  hmac = HMAC::SHA256.new($AWS_KEY)
  hmac.update ['GET',$SNS_ENDPOINT,'/',canonical_query_string(params)].join("\n")
  signature = Base64.encode64(hmac.digest).chomp
end

def publish(phone, msg)
  # I nedd to provide a TOPIC OR A PHONENUMBER, not both!
  params = {
    #'PhoneNumber' => phone,
    'Message' => msg,
    'TopicArn' => 'arn:aws:sns:us-west-2:811937959946:tcc-test',
    'Action' => 'Publish',
    'SignatureMethod' => 'HmacSHA256',
    'SignatureVersion' => 2,
    'Timestamp' => Time.now.utc.iso8601,
    'AWSAccessKeyId' => $AWS_ID
  }
  params['Signature']=sign_request(params)
  query_string = canonical_query_string(params)

  response=Net::HTTP.get_response(URI.parse("http://#{$SNS_ENDPOINT}/?#{query_string}"))
  raise "SNS Publish failed #{response.code}\n#{response.body}" unless response.code=="200"
end

def phone_publish(phone, msg)

  sns = Aws::SNS::Client.new(region: 'us-west-2', access_key_id: $AWS_ID, secret_access_key: $AWS_KEY)
  sns.publish({phone_number: phone, message: msg})
end
