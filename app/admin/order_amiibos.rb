ActiveAdmin.register OrderAmiibo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :quantity, :unitPrice, :order_id, :amiibo_id, :tax_rate
  #
  # or
  #
  # permit_params do
  #   permitted = [:quantity, :unitPrice, :orderId, :amiiboId]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
