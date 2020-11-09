module SignInHelper
  def sign_in_as(user)                # ❶
    OmniAuth.config.test_mode = true  # ❷
    OmniAuth.config.add_mock(         # ❸
      user.provider,
      uid: user.uid,
      info: { nickname: user.name,
              image: user.image_url })

    case
    when respond_to?(:visit)
      visit root_url                    # ❹
      click_on "GitHubでログイン"
    when respond_to?(:get)
      get "/auth/github/callback"
    else
      raise NotImplementedError.new
    end
    @current_user = user
  end

  def current_user
    @current_user
  end
end

class ActionDispatch::IntegrationTest   # ❷
  include SignInHelper                  # ❸
end
