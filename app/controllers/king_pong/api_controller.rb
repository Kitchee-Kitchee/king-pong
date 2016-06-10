require 'king_pong/application_controller'

module KingPong
  class ApiController < ApplicationController
    before do
      # set response content type, it is an API here
      content_type 'application/json'
    end

    # catch errors on invalid records
    error ActiveRecord::RecordInvalid do
      error = env['sinatra.error']
      record = error.record
      [400, {}, {errors: record.errors, request: request_payload}.to_json]
    end

    error ActiveRecord::RecordNotFound do
      [404, {}, error_on_404]
    end

    def error_on_404
      {
        error: 'The resource you are looking for does not exist.',
        request: request_payload
      }.to_json
    end

    def request_payload
      {
        method: request.request_method,
        path: request.path,
        params: request.params
      }
    end
  end
end
