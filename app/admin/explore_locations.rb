ActiveAdmin.register ExploreLocation do

  filter :city_name
  
  permit_params :title, :city_name, :desciption
  
  index do
    column :title
    column :city_name
    column :desciption
  end

  show do
    row :title
    row :city_name
    row :desciption
  end
  controller { actions :all}
end
