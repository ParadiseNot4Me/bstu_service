module ExceptionHandlable extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing, with: :rescue_bad_request
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_unprocessable_entity
    rescue_from ActiveRecord::UnknownAttributeError, with: :rescue_unprocessable_entity
  end

  # 400 Bad Request
  def rescue_bad_request(message)
    error = { error:  message }
    render json: error, status: :bad_request
  end

  # 404 Not Found
  def rescue_not_found(errors = {})

    render json: { error: 'Record Not Found' }, status: :not_found
  end

   def rescue_not_found_custom(message)

    render json: { error: message }, status: :not_found
  end


  # 422 Unprocessable Entity
  def rescue_unprocessable_entity(errors = {})
    error = {
      error: errors.record.errors.full_messages 
    } if errors.record
    render json: error, status: :unprocessable_entity
  end

  # 401 Forbidden
  def rescue_unauthorized(message)
    error = { error:  message }
    render json: error, status: :unauthorized
  end
  # 403 Forbidden
  def rescue_access_denied(message)
    error = { error:  message }
    render json: error, status: :forbidden
  end
end