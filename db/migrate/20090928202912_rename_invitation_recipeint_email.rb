class RenameInvitationRecipeintEmail < ActiveRecord::Migration
  ## fix typo
  def self.up
    rename_table :invitatons, :invitations
    rename_column :invitations, :recipeint_email, :recipient_email
  end

  def self.down
    rename_table :invitations, :invitatons
    rename_column :invitations, :recipient_email, :recipeint_email
  end
end
