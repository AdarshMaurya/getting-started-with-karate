Feature: sample karate test script to test xml

  Background:
    * url 'https://www.softhinkers.com'

  Scenario: get state value

    Given path '/dinesense-web/crud'
    When method get
    Then status 200

    * def response =
   """
    <root>
      <name>
          <firstname>sample_name</firstname>
          <lastname>sample_name</lastname>
      </name>
      <location>
          <planet>sample_planet_name</planet>
          <country>sample_country_name</country>
          <state>sample_state_name</state>
      </location>
    </root>
 """

    * def roots = response
    * def state = get roots //location/state
    * match state contains '#notnull'

