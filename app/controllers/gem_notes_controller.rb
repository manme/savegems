class GemNotesController < ApplicationController
  before_action :gem_note_facade, except: [:destroy]
  before_action :set_gem_note, only: :destroy

  def index
    @facade.all
  end

  def create
    if @facade.create(gem_note_params)
      respond_to do |format|
        format.html { redirect_to :gem_notes }
        format.js { render json: { status: :success, code: 200, id: @facade.gem_note.id} }
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
    if @facade.update(gem_note_params)
      @facade.gem_note.reload
      respond_to do |format|
        format.html { redirect_to :gem_notes }
        format.js do
          render json: { status: :success,
                         code: 200,
                         id: @facade.gem_note.id,
                         original: @facade.gem_note.original,
                         description: @facade.gem_note.description,
                         active: @facade.gem_note.actived?
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
    @gem_note.destroy
    respond_to do |format|
      format.html { redirect_to :gem_notes }
      format.js do
        render json: { status: :success, code: 200, id: gem_note.id}
      end
    end
  end

  def show
    if params[:id].present?
      @facade.show params[:id]
    else

    end
  end

  private

  def gem_note_params
    { active: '0' }.merge params.require(:gem_note).permit(:original,
      :description,
      :active).merge(id: params[:id]).symbolize_keys
  end

  def gem_note_facade
    @facade = GemNotesFacade.new current_user
  end

  def set_gem_note
    # @facade.find(id: params[:id])
    @gem_note = GemNote.find_by(id: params[:id])
    render json: { status: :error, code: 404 } if @gem_note.nil?
  end
end
