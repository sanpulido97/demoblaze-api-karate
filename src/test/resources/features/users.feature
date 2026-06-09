Feature: Pruebas de servicios Signup y Login en Demoblaze

  Background:
    * url 'https://api.demoblaze.com'
    * def password = 'Password123'
    * def newUser = 'user_' + java.lang.System.currentTimeMillis()
    * def existingUser = 'existing_user_karate_test'

  Scenario: Crear un nuevo usuario en signup
    * def signupRequest =
    """
    {
      "username": "#(newUser)",
      "password": "#(password)"
    }
    """
    Given path 'signup'
    And request signupRequest
    And print 'Entrada signup usuario nuevo:', signupRequest
    When method post
    Then status 200
    And print 'Salida signup usuario nuevo:', response

  Scenario: Intentar crear un usuario ya existente
    * def firstSignupRequest =
    """
    {
      "username": "#(existingUser)",
      "password": "#(password)"
    }
    """
    Given path 'signup'
    And request firstSignupRequest
    And print 'Entrada primer signup usuario existente:', firstSignupRequest
    When method post
    Then status 200
    And print 'Salida primer signup usuario existente:', response

    * def secondSignupRequest =
    """
    {
      "username": "#(existingUser)",
      "password": "#(password)"
    }
    """
    Given path 'signup'
    And request secondSignupRequest
    And print 'Entrada segundo signup usuario existente:', secondSignupRequest
    When method post
    Then status 200
    And print 'Salida signup usuario ya existente:', response
    And match response contains { errorMessage: '#string' }

  Scenario: Usuario y password correcto en login
    * def signupRequest =
    """
    {
      "username": "#(newUser)",
      "password": "#(password)"
    }
    """
    Given path 'signup'
    And request signupRequest
    When method post
    Then status 200

    * def loginRequest =
    """
    {
      "username": "#(newUser)",
      "password": "#(password)"
    }
    """
    Given path 'login'
    And request loginRequest
    And print 'Entrada login correcto:', loginRequest
    When method post
    Then status 200
    And print 'Salida login correcto:', response

  Scenario: Usuario y password incorrecto en login
    * def loginIncorrectRequest =
    """
    {
      "username": "usuario_incorrecto_karate",
      "password": "password_incorrecto"
    }
    """
    Given path 'login'
    And request loginIncorrectRequest
    And print 'Entrada login incorrecto:', loginIncorrectRequest
    When method post
    Then status 200
    And print 'Salida login incorrecto:', response
    And match response contains { errorMessage: '#string' }