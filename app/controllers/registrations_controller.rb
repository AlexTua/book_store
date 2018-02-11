class RegistrationsController < Devise::RegistrationsController
  def address_settings
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    @address = Address.where(user_id: params[:address][:user_id],
                               address_type: params[:address][:address_type]).first_or_create do |add|
                                add.update(address_params)
                              end
    if @address.update(address_params)
      redirect_to edit_user_registration_path, notice: I18n.t('flash.account_updated')
    else
      render "edit"
    end
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address_name, :city, :zip,
                                    :country, :phone, :address_type, :user_id)
  end

  protected

  def update_resource(resource, params)
    if params.include?(:current_password)
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

  def after_update_path_for(resource)
    edit_user_registration_path(tab: params[:tab])
  end
end
