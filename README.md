# AWS S3 Cross Account Tester

A frequent task across AWS s3 accounts is to put object into an s3 bucket or read and object from a bucket. 

This s3 cross account tester is an incredibly simple ruby program designed to simply test if an object can be written to a bucket.

This will show that permissions across accounts (or within one account) have been setup correctly regarding IAM users or roles. 

This program assumes that a program or user are being given programatic API access via access keys.

## How to use this program

### Setup

This program uses the Dotenv gem to populate the environmental variables within the shell it is being ran in.

The `.env.example` file can be renamed to `.env` and populated with the appropriate values.

You will need your:
* AWS_SECRET_ACCESS_KEY
* AWS_ACCESS_KEY_ID
* AWS_REGION
* AWS_S3_BUCKET

where `AWS_S3_BUCKET` is the name of the bucket you're trying to access. (Not the ARN - just the bucket name - eg. `test-bucket`)

### Running

Once the `.env` file is populated simply `ruby run.rb`.

The output of this will be a raised exception if something goes wrong - eg, no permissions or bucket does not exist.

If all goes right the result objects key value pairs are printed to the screen.

* Note: the .env file is included in the `.gitignore` file and should not be commited to any of your repos. Do NOT commit secrets!