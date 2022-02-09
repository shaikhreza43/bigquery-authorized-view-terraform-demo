gcloud auth login
Enable-HttpProxy
gcloud config set auth/impersonate_service_account sa-dfaccessprovis-developer@prj-dfaccessprovision-c-c032.iam.gserviceaccount.com
gcloud config set project prj-dfaccessprovision-d-64a9
gcloud auth application-default login
$env:GOOGLE_OAUTH_ACCESS_TOKEN = "$(gcloud auth print-access-token)"