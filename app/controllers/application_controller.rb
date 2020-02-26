class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admin_items_path
        when EndUser
            public_end_user_path(current_end_user.id) # ログイン後に遷移するpathを設定
        end
        
    end

end
