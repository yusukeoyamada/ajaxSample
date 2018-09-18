class SnsUsers::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash={})
    hash[:uid] = SnsUser.create_unique_string
    super
  end
end
