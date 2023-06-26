ActiveAdmin.register Hotel do

  filter :name
  
  permit_params :name, :description, :address, :explore_location_id, :user_id
  actions :all

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :description
    column "Explore Location" do |location|
      link_to location.explore_location.city_name, admin_explore_location_path(location.explore_location_id)
    end
    column "User" do |user|
      link_to user&.user&.name, admin_user_path(user.user_id)
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name 
      row :address
      row :description
      row :explore_location
      row :user
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :description
      f.input :explore_location_id, :as => :select, :collection => ExploreLocation.all.collect{|location| [location.city_name, location.id] }
      f.input :user_id, :as => :select, :collection => User.all.collect{|user| [user.name, user.id]}
    end
    actions 
  end
end
