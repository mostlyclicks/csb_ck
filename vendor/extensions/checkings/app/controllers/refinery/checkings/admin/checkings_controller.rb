module Refinery
  module Checkings
    module Admin
      class CheckingsController < Refinery::AdminController

        crudify :'refinery/checkings/checking', 
                :title_attribute => "first_name", 
                :order => "created_at DESC"

        def index
          if searching?
            search_all_checkings
          else
            find_all_checkings
          end

          @grouped_checkings = group_by_date(@checkings)
        end


        private

        # Only allow a trusted parameter "white list" through.
        def checking_params
          params.require(:checking).permit(:first_name, :last_name, :email, :phone, :additional_comments)
        end
      end
    end
  end
end
