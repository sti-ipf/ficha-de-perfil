class AddFieldsToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :author_coauthor, :boolean
    add_column :profiles, :books, :text
    add_column :profiles, :text_editor_level, :integer
    add_column :profiles, :spreadsheet_editor_level, :integer
    add_column :profiles, :presentation_editor_level, :integer
    add_column :profiles, :browser_level, :integer
    add_column :profiles, :email_level, :integer
    add_column :profiles, :os_level, :integer
    add_column :profiles, :vetorial_image_editor_level, :integer
    add_column :profiles, :photo_editor_level, :integer
    add_column :profiles, :media_player_level, :integer
    add_column :profiles, :activity_in_social_moviments, :boolean
    add_column :profiles, :worked_in_public_school, :boolean
    add_column :profiles, :work_in_another_institution, :boolean
    add_column :profiles, :another_institution_name, :string
    add_column :profiles, :another_institution_contact, :string
    add_column :profiles, :another_institution_site, :string
    add_column :profiles, :partner_in_another_company, :boolean
    add_column :profiles, :another_company_name, :string
    add_column :profiles, :another_company_contact, :string
    add_column :profiles, :another_company_site, :string
  end

  def self.down
  end
end
