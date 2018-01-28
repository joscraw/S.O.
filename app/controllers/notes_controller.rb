# Note controller performs basic CRUD actions on
# a Single Note or collection of Note Objects
#
# @author Josh Crawmer
#
class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # Displays all notes with most recently created at the top.
  # Selects only the values needed to enhance query performance
  # GET /notes
  def index
    @notes = Note.select(:id, :title, :type_of, :deadline).order('created_at DESC')
  end

  # Shows note information by passing in a given note id
  # GET /notes/1
  def show
  end

  # Renders form for creating a new note
  # GET /notes/new
  def new
    @note = Note.new
  end

  # displays form for editing an already existing note
  # GET /notes/1/edit
  def edit
  end

  # handles creating a new note. Performs redirect to main notes
  # page on success.
  #
  # POST /notes
  def create

    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html {
          flash[:success] = 'Note was successfully created.'
          redirect_to :notes
        }
      else
        format.html {render :new}
      end
    end
  end

  # Handles updating an already existing note. Performs redirect to notes
  # page on success.
  #
  # PATCH/PUT /notes/1
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html {
          flash[:success] = 'Note was successfully updated.'
          redirect_to :notes
        }
      else
        format.html {render :edit}
      end
    end
  end

  # Deletes a given note.
  #
  # DELETE /notes/1
  def destroy
    @note.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Note was successfully deleted'
        redirect_to :notes
      }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Set up whitelisted parameters that are allowed
  def note_params
    params.require(:note).permit(:title, :type_of, :description, :month, :day, :year)
  end
end
