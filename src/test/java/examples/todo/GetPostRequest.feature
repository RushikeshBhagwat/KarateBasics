@testfile
Feature: Karate Basics First feature file

  Background:
    * url apiUrl
    * def orderStatus = 'placed'

  Scenario: Get the inventory
    Given path 'inventory'
    When method Get
    Then status 200

    Scenario: Post request test
      Given path 'order'
      And request {"id": 1,"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126Z","status": "placed","complete": true}
      When method post
      Then status 200
      And match response == {"id": '#number',"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126+0000","status": '#(orderStatus)',"complete": true}
      * def id = response.id
      * def petID = response.petId
      * print 'Value of ID: ' +id


      # Get single order
    Scenario: Get single order generated from above scenario
      Given path 'order/1'
      When method Get
      Then status 200
      And match response == {"id": 1,"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126+0000","status": "placed","complete": true}

