module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

   def connect
     self.current_user = find_verified_user
   end

   protected

   def find_verified_user
     if verified_user = Group.find_by(id: session['nowgroup'])
       verified_user
     else
       reject_unauthorized_connection
     end
   end

   def session
     cookies.encrypted[Rails.application.config.session_options[:key]]
   end
  end
end
