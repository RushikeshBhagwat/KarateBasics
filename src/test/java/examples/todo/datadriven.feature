@debug
Feature: Data driven testing example

  Background:
    * url apiUrl

  Scenario Outline:
    Given path 'order'
    And request {"id": '#(ID)' ,"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126Z","status": "placed","complete": true}
    When method post
    Then status 200
    * def newId = response.id
    * print 'newly generated id: ' +newId


    Examples:
    | ID |
    | 45 |
    | 46 |
    | 47 |