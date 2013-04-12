class GithubPayloadsController < ActionController::Base 

  def create
    Payload.create(params[:payload])
    render :json => {}
  end

end
