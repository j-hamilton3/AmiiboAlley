ActiveAdmin.register Amiibo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :release_date, :amiibo_series_id, :game_series_id, :character_id, :image, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :release_date, :amiibo_series_id, :game_series_id, :character_id, :image, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
