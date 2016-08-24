module API
  module Entities
    class Articles < Grape::Entity
      expose :title, documentation: { type: String }
      expose :url, documentation: { type: String }
      expose :author, documentation: { type: String }
    end
  end
end
