require 'auth0_management_api'
require 'json'

class AddUserJob < ApplicationJob
  def perform(user)
    Tempfile.create(['import-target', '.json']) do |file|
      file.write(JSON.dump([convert_user(user)]))
      file.rewind

      Auth0ManagementApi.client.import_users(
        file,
        connection_id,
        { send_completion_email: true }
      )
    end
  end

  private def connection_id
    ENV.fetch('AUTH0_CONNECTION_ID')
  end

  private def convert_user(user)
    {
      email: user.email,
      email_verified: true,
      custom_password_hash: {
        algorithm: 'bcrypt',
        hash: { value: user.encrypted_password },
      },
      app_metadata: {
        custom_user_id: user.id
      }
    }
  end
end
