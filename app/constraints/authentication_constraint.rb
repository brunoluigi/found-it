class AuthenticationConstraint
  def self.authenticated
    new(true)
  end

  def self.unauthenticated
    new(false)
  end

  def initialize(authenticated)
    @authenticated = authenticated
  end

  def matches?(request)
    # Resume the session to check authentication status
    session_id = request.cookie_jar.signed[:session_id]
    current_session = Session.find_by(id: session_id) if session_id

    # Set Current.session if found
    Current.session = current_session if current_session

    if @authenticated
      # Return true if authenticated
      !Current.session.nil?
    else
      # Return true if unauthenticated
      Current.session.nil?
    end
  end
end
