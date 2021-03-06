Feature: Search RubyGems to discover new Test Kitchen Driver gems
  In order to periodically check for new/updated Kitchen drivers
  As a Test Kitchen user
  I want to run a command which returns candidate Kitchen drivers

  @spawn
  Scenario: Displaying help
    When I run `kitchen help driver discover`
    Then the output should contain:
    """
    Usage:
      kitchen driver discover
    """
    And the exit status should be 0

  Scenario: Running driver discover returns live results
    When I run `kitchen driver discover`
    Then the exit status should be 0
    And the output should contain "kitchen-bluebox"

  Scenario: Running driver discover with the --chef-config-path parameter loads the chef config
    Given an empty file named "kitchen_client.rb"
    When I run `kitchen driver discover --chef-config-path=kitchen_client.rb`
    Then the exit status should be 0
    And the output should contain "kitchen-bluebox"
