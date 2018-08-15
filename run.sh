#!/bin/sh

__APP=$(basename $0)

__ENV="dev"

#DEBUG=1

do_error()
{
  echo "${__APP}: error: $@" >&2
  exit 1
}

do_info()
{
  echo "### $@"
}

do_ask()
{
  while true;
  do
    echo -n "$@ [y/N] "
    read _a
    if [ -z "${_a}" -o "${_a}" == "n" -o "${_a}" == "N" ]
    then
      return 0
    elif [ "${_a}" == "y" -o "${_a}" == "Y" ]
    then
      return 1
    fi
  done
}

if [ "x$DEBUG" != "x" ]
then
  export OS_DEBUG=1
  export TF_LOG=DEBUG
fi


do_info "loading configuration..."
source ./config/openstackrc || do_error "failed to load OpenStack configuration"

# Initialize the Terraform working directory.
do_info "provider initialization..."
terraform get -update=true || do_error "failed to update modules"
terraform init -input=false || do_error "failed to initialize providers"

do_info "validation..."
terraform validate -var-file=config/${__ENV}.tfvars -input=false || do_error "validation failed"

# Produce a plan for changing resources to match the current configuration.
do_info "planning..."
terraform plan -var-file=config/${__ENV}.tfvars -out=tfplan -input=false || do_error "plan failed"

# Have a human operator review that plan, to ensure it is acceptable.
if do_ask "Continue deployment?"
then
  do_info "deployment canceled"
else
  do_info "deployment..."
  terraform apply -input=false tfplan || do_error "deployment failed"
fi

rm tfplan

do_info "done"
