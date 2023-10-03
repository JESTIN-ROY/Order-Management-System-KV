# frozen_string_literal: true

module ApiResponders
  extend ActiveSupport::Concern

  private

    def record_not_found
      render status: :not_found, json: { error: t("not_found") }
    end

    def respond_with_error(message, status = :unprocessable_entity, context = {})
      is_exception = message.kind_of?(StandardError)
      error_message = is_exception ? message.record&.errors_to_sentence : message
      render :status, json: { error: error_message }.merge(context)
    end

    def handle_not_found_enitiy_response(entity)
      render status: :not_found, json: { error: t("not_found", :entity) }
    end

    def respond_with_success(message, status = :ok, context = {})
      render :status, json: { notice: message }.merge(context)
    end

    def respond_with_json(json = {}, status = :ok)
      render :status, json:
    end

    def respond_with_id_and_success(message, id, status = :ok, context = {})
      render :status, json: { notice: message, id: }.merge(context)
    end
end
