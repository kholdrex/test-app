module API
  class Articles < Grape::API
    format :json

    helpers do
      def empty_content
        {}
      end

      def not_found!
        error!('Not found', 404)
      end

    end

    resource :articles do

      desc "GET articles", entity: API::Entities::Articles
      get do
        present Article.all, with: API::Entities::Articles
      end

      desc "GET article by Id"
      route_param :id do
        get do
          article = Article.find_by(id: params[:id])

          not_found! unless article

          present article, with: API::Entities::Articles
        end
      end
    end
  end
end

