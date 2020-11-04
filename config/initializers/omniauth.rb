Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "c020f67014911535c4d5", "56d60da7cb3009c437c9abbbfac30dc5490d7951"  # ❶
  else
    provider :github,   # ❷
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end
