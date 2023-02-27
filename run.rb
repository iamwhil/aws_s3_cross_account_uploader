require 'aws-sdk-s3'
require 'dotenv'
require 'json'

Dotenv.load

def build_s3_client
  aws_access_key_id = ENV.fetch('AWS_ACCESS_KEY_ID')
  aws_secret_access_key = ENV.fetch('AWS_SECRET_ACCESS_KEY')
  aws_region = ENV.fetch('AWS_REGION')
  Aws::S3::Client.new(
    region: aws_region,
    access_key_id: aws_access_key_id,
    secret_access_key: aws_secret_access_key
  )
end

def build_payload
  bucket = ENV.fetch('AWS_S3_BUCKET')
  {
    body: { hello: 'world' }.to_json,
    bucket: bucket,
    key: 'mystery-team/test.json'
  }
end

s3_client = build_s3_client

# Put the test object into s3.
# If the `test.json` file appears in your bucket your credentials are working.
response = s3_client.put_object(build_payload)

response.each_pair { |(name, value)| p "#{name} => #{value}" }
