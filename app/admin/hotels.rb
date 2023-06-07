ActiveAdmin.register Hotel do

  filter :name
  
  permit_params :name, :description, :address, :explore_location_id
  
  index do
    column :name
    column :address
    column :description
    column :explore_location_id   
  end
end
