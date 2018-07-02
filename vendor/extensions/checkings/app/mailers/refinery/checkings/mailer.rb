module Refinery
  module Checkings
    class Mailer < ::ActionMailer::Base

      def confirmation(checking, request)
        @checking = checking
        mail :subject  => Refinery::Checkings::Setting.confirmation_subject,
             :to       => checking.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::Checkings::Setting.notification_recipients.split(',').first
      end

      def notification(checking, request)
        @checking = checking
        mail :subject  => Refinery::Checkings::Setting.notification_subject,
             :to       => Refinery::Checkings::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
