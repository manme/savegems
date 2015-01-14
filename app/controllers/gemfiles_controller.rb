class GemfilesController < ApplicationController
  before_action :gemfile_facade, except: :destroy
  before_action :set_gemfile, only: :destroy

  def index
    @facade.all
  end

  def show
    if params[:id].present?
      @facade.show params[:id]
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def create
    if @facade.create(gemfile_params)
      respond_to do |format|
        format.html { redirect_to :gemfiles }
        format.js { render json: { status: :success, code: 200, id: @facade.gemfile.id} }
      end
    else
      respond_to do |format|
        format.html do
          @facade.all
          render :index
        end
        format.js { render json: { status: :error, code: 500 } }
      end
    end
  end

  def update
    if @facade.update(gemfile_params)
      @facade.gemfile.reload
      respond_to do |format|
        format.html { redirect_to :gemfiles }
        format.js do
          render json: { status: :success,
                         code: 200,
                         id: @facade.gemfile.id,
                         original: @facade.gemfile.name,
                         description: @facade.gemfile.content
                 }
        end
      end
    else
      respond_to do |format|
        format.html do
          @facade.all
          render :index
        end
        format.js { render json: { status: :error, code: 500 } }
      end
    end
  end

  def destroy
    @gemfile.destroy
    respond_to do |format|
      format.html { redirect_to :gemfiles }
      format.js do
        render json: { status: :success, code: 200, id: @gemfile.id}
      end
    end
  end

  private


  def gemfile_params
    params.require(:gemfile).permit(:name, :content).merge(id: params[:id])#.symbolize_keys
  end

  def gemfile_facade
    @facade = GemfileFacade.new current_user
  end

  def set_gemfile
    @gemfile = Gemfile.find_by(id: params[:id])
    render json: { status: :error, code: 404 } if @gemfile.nil?
  end
end
