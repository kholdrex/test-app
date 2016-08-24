require 'grape-swagger'

module API
  class Root < Grape::API
    prefix 'api'
    error_formatter :json, API::ErrorFormatter

    mount API::Articles

    add_swagger_documentation mount_path: '/docs',
                              api_version: 'v1',
                              hide_documentation_path: true,
                              hide_format: true,
                              models: [],
                              info: {
                                  :title => 'Hacker News RESTful API',
                                  :description => 'Our RESTful API offers all basic functionalities',
                                  :terms_of_service_url => 'https://hacker-news-kholdrex.herokuapp.com'
                              }
  end
end
