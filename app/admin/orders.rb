ActiveAdmin.register Order do
  permit_params :orderDate, :user_id, :status

  form do |f|
    f.semantic_errors(*(f.object.errors.attribute_names))
    f.inputs 'Order Details' do
      f.input :orderDate, as: :datepicker
      f.input :user, as: :select, collection: User.all.map { |u| [u.email, u.id] }
      f.input :status, as: :select, collection: Order.statuses.keys.map { |status| [status.titleize, status] }
    end
    f.actions
  end
end
