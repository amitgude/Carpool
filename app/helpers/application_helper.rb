module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
 
  def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end

end
