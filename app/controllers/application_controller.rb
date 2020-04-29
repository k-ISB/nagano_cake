class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admin_items_path
        when EndUser
            end_users_path # ログイン後に遷移するpathを設定
        end
        
    end

    # def after_sign_out_path_for(resource) #ログアウト後に遷移するpathを設定
    #     case resource
    #     when Admin
    #         new_admin_session_path
    #     when EndUser
    #         new_end_user_session_path
    #     end
    # end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, 
                                                           :last_name,
                                                           :kana_first_name,
                                                           :kana_last_name,
                                                           :email,
                                                           :postal_code,
                                                           :address,
                                                           :telephone_number])
                                                               
    end

end
