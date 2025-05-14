Feature: Karate basics Second feature file

  Background:
    * url apiUrl

  # Post request using other approach
  Scenario: Post request using other approach
    * def requestBody =
      """
      {"id": 3,"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126Z","status": "placed","complete": true}
      """
    Given path 'order'
    And request requestBody
    And headers { 'Content-Type':'application/json' , 'accept':'application/json'}
    When method post
    Then status 200
    And match response.id == 3

  # Delete request
  Scenario: Delete created order
    Given path 'order/3'
    When method delete
    Then status 200
    And match response.code == 200


