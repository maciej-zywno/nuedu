require 'rails_email_preview'
# require 'rails_email_preview/integrations/comfortable_mexica_sofa'

#= REP hooks and config
RailsEmailPreview.setup do |config|
#
#  # hook before rendering preview:
#  config.before_render do |message, preview_class_name, mailer_action|
#    # apply premailer-rails:
#    Premailer::Rails::Hook.delivering_email(message)
#    # or actionmailer-inline-css:
#    ActionMailer::InlineCssHook.delivering_email(message)
#  end
#
#  # do not show Send Email button
 config.enable_send_email = true
#
#  # You can specify a controller for RailsEmailPreview::ApplicationController to inherit from:
#  config.parent_controller = 'Admin::ApplicationController' # default: '::ApplicationController'
end

#= REP + Comfortable Mexican Sofa integration
#
# # enable comfortable_mexican_sofa integration:
# require 'rails_email_preview/integrations/comfortable_mexica_xsofa'

Rails.application.config.to_prepare do
  # Render REP inside a custom layout (set to 'application' to use app layout, default is REP's own layout)
  # This will also make application routes accessible from within REP:
  RailsEmailPreview.layout = 'admin'

  # Set UI locale to something other than :en
  # RailsEmailPreview.locale = :en
  
  RailsEmailPreview::ApplicationController.module_eval do
    before_filter :check_rep_permissions

    private
    def check_rep_permissions
       redirect_to '/', notice: 'no access' unless current_user && current_user.has_role?(:cms_admin)
    end
  end


  # Auto-load preview classes from:
  RailsEmailPreview.preview_classes = Dir[Rails.root.join 'app/mailer_previews/*_preview.rb'].map { |p|
    File.basename(p, '.rb').camelize
  }
end
