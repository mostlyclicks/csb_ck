module Refinery
  module Checkings
    class CheckingsController < ::ApplicationController

      before_action :find_page, :only => [:create, :new]

      def index
        redirect_to refinery.new_checkings_checking_path
      end

      def thank_you
        @page = Refinery::Page.where(link_url: "/checkings/thank_you").first
      end

      def new
        @checking = Checking.new
      end

      def create
        @checking = Checking.new(checking_params)

        if @checking.save
          begin
            Mailer.notification(@checking, request).deliver_now
          rescue => e
            logger.warn "There was an error delivering the checking notification.\n#{e.message}\n"
          end

          if Checking.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@checking, request).deliver_now
            rescue => e
              logger.warn "There was an error delivering the checking confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to Checking if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_checkings_checkings_path
        else
          render :action => 'new'
        end
      end

      protected

      def find_page
        @page = Refinery::Page.where(link_url: "/checkings/new").first
      end

      private

    # Only allow a trusted parameter "white list" through.
      def checking_params
        params.require(:checking).permit(:first_name, :last_name, :email, :phone, :additional_comments)
      end
    end
  end
end
