resource "launchdarkly_feature_flag" "building_materials" {
  project_key = module.anzx_plat_test.project_key
  key = "building-materials"
  name = "Building materials"
  description = "this is a multivariate flag with string variations"

  variation_type = "string"
  variations {
    value = "straw"
    name = "straw"
    description = "Watch out for wind."
  }

  variations {
    value = "sticks"
    name = "sticks"
    description = "Sturdier than straw"
  }

  variations {
    value = "bricks"
    name = "bricks"
    description = "The strongest variation"
  }

  default_on_variation  = "bricks"
  default_off_variation = "straw"

  tags = [
    "example",
    "terraform",
    "multivariate",
    "building-materials",
  ]

}

resource "launchdarkly_feature_flag" "new_logo" {
  project_key = module.anzx_plat_test.project_key
  key = "new-logos"
  name = "new-logos"
  description = "this is a multivariate flag with string variations"

  variation_type = "string"
  variations {
    value = "blue"
    name = "blue"
    description = "Watch out for wind."
  }

  variations {
    value = "red"
    name = "red"
    description = "Sturdier than straw"
  }

  variations {
    value = "green"
    name = "green"
    description = "The strongest variation"
  }

  default_on_variation  = "green"
  default_off_variation = "blue"

  tags = [
    "example",
    "terraform",
    "multivariate",
    "building-materials",
  ]

}

resource "launchdarkly_feature_flag_environment" "building_env" {
  flag_id = launchdarkly_feature_flag.building_materials.id
  env_key = "production"

  targeting_enabled = true

  prerequisites {
    flag_key  = launchdarkly_feature_flag.new_logo.key
    variation = 0
  }

  user_targets {
    values = ["user0"]
  }
  user_targets {
    values = ["user1", "user2"]
  }
  user_targets {
    values = []
  }

  rules {
    clauses {
      attribute = "country"
      op        = "startsWith"
      values    = ["aus", "de", "united"]
      negate    = false
    }
    variation = 0
  }

  flag_fallthrough {
    rollout_weights = [60000, 40000, 0]
  }
}