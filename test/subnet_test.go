package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestNetworkCreationModule(t *testing.T) {
	t.Parallel()

	fixtureFolder := "fixture"

	terraformOptions := configureTerraformOptions(t, fixtureFolder)

	// website::tag::5:: Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::3:: Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// website::tag::4:: Run `terraform output` to get the values of output variables and check they have the expected values.
	v_name := terraform.Output(t, terraformOptions, "virtual-network-name")
	s_name := terraform.Output(t, terraformOptions, "subnet-name")
	v_cidr := terraform.Output(t, terraformOptions, "vnet-cidr")
	s_cidr := terraform.Output(t, terraformOptions, "snet-cidr")
	dns_cidr := terraform.Output(t, terraformOptions, "dns-server")

	assert.Equal(t, "vnet-dev-test-1", v_name)
	assert.Equal(t, "10.10.0.0/18", v_cidr)
	assert.Equal(t, "10.10.0.20", dns_cidr)
	assert.Equal(t, "snet-dev-test-1", s_name)
	assert.Equal(t, "10.10.2.0/26", s_cidr)
}

func configureTerraformOptions(t *testing.T, fixtureFolder string) *terraform.Options {

	terraformOptions := &terraform.Options{
		TerraformDir: fixtureFolder,

		Vars: map[string]interface{}{},

		VarFiles: []string{"test-inputs.tfvars.json"},
	}

	return terraformOptions
}
