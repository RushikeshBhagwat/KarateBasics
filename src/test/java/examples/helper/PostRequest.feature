Feature: Helper feature that should be called in other feature file


  Scenario: Post request test
    Given path 'https://petstore.swagger.io/v2/store/order'
    And request {"id": 10,"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126Z","status": "placed","complete": true}
    When method post
    Then status 200
  #  And match response == {"id": '#number',"petId": 0,"quantity": 0,"shipDate": "2025-05-11T11:21:18.126+0000","status": '#(orderStatus)',"complete": true}
    * def id = response.id
    * def petID = response.petId
    * print 'Value of ID: ' +id