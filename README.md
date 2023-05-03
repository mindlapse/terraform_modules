## Terraform Modules
A small collection of small Terraform modules for AWS


### bootstrap/tf_remote_state

This module creates a bucket with cross-region replication enabled, which
can be useful as a remote backend for a Terraform project


### sqs_lambda

This module is an SQS queue that invokes a Lambda.  Includes a DLQ.


### scheduled_lambda

This module is a CloudWatch timer that invokes a Lambda.  Includes a DLQ.

