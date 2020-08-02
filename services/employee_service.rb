module Employee
    include HTTParty
    base_uri 'inm-api-test.herokuapp.com'
    format :json
end
