ActiveAdmin.register User do

  filter :name
  filter :email 
  filter :username

  
  actions :all
  permit_params :email, :name, :username, :phone_number, :activated, :password_digest
  

  index do
    selectable_column
    id_column
    column :email
    column :name 
    column :username 
    column :phone_number
    column :activated
    actions
  end

  show do
    attributes_table do 
      row :email
      row :name 
      row :username
      row :phone_number
      row :activated
    end
  end

  form do |f|
    f.inputs do 
      f.input :email
      f.input :name 
      f.input :username 
      f.input :phone_number
      f.input :activated
    end
    actions
  end
  
end
