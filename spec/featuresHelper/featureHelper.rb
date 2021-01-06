module FeatureTestHelpers
  def do_login(email, password)
    visit new_user_session_path
    fill_in('user_email', with: email)
    fill_in('user_password', with: password)
    click_button('Log in')
  end

  def do_sign_up(service)
    visit new_user_registration_path
    fill_in('user_name', with: 'user1')
    fill_in('user_email', with: 'user1@user.com')
    fill_in('user_password', with: 'user12')
    fill_in('user_password_confirmation', with: 'user12')
    find('#user_service').find(:option, service).select_option
    click_button('Sign up')
  end
end
