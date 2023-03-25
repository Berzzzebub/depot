# frozen_string_literal: true

module StoreIndexCounter
  private
  def session_count
    if session[:counter]
      session[:counter] += 1
    else
      session[:counter] = 1
    end
    @session_count = session[:counter]
  end

  def reset_session_counter
    session[:counter] = 0
    @session_count = session[:counter]
  end
end
