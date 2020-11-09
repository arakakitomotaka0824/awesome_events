require 'test_helper'
class StatusControllerTest < ActionDispatch::IntegrationTest
  test "GET /status" do
    get "/status"                # ❶
    assert_response(:success)    # ❷
    assert_equal({ status: "ok" }.to_json, @response.body)  # ❸
    assert_equal("application/json", @response.media_type)  # ❹
  end
end
