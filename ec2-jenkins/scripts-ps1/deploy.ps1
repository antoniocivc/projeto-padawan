terraform -chdir="../" plan -var="key_name=key_to_ssh"
terraform -chdir="../" apply --auto-approve -var="key_name=key_to_ssh"
.\chmod400.ps1