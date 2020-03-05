class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session
  
  # GET /people
  # GET /people.json
  def index
    @people = Person.order(:surname)
    @people = Kaminari.paginate_array(@people).page(params[:page]).per(10)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @locations = Location.all
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    
    birthMonth = person_params[:birthNumber][2,2].to_i > 50 ? person_params[:birthNumber][2,2].to_i-50 : person_params[:birthNumber][2,2].to_i
    birthMonth = birthMonth.to_s.length == 2 ? birthMonth : "0"+birthMonth.to_s
    if person_params[:birthNumber][0,2].to_i < 54 && person_params[:birthNumber].length != 10
      birthYear = "20"+person_params[:birthNumber][0,2]
    else
      birthYear = "19"+person_params[:birthNumber][0,2]
    end
    @person.dateOfBirth = "#{person_params[:birthNumber][4,2]}/#{birthMonth}/#{birthYear}"
    @person.sex = person_params[:birthNumber][2,2].to_i > 50 ? 'Žena' : 'Muž'

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Osoba byla vytvořena.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Osoba byla upravena.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Osoba byla úspěšně smazána.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :surname, :birthNumber, :phoneNumber, :sex, :dateOfBirth)
    end
end
