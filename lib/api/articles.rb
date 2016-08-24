module API
  class Articles < Grape::API
    format :json

    resource :articles do

      desc "GET articles", entity: API::Entities::Articles
      get do
        present Article.all
      end

      desc "GET article by Id"
      get :id do
        present Article.find_by(id: params[:id])
      end
    end
  end
end

