class UsersController < ApplicationController
  before_action :set_user, only: [:remove_course, :add_course, :show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @courses = Course.where('user_id = ?', @user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def authenticate
    puts params.inspect
    u = User.find_by(cartao: params['user']['cartao'])
    puts u.inspect
    if u then
      auth = u.authenticate(params['user']['password'])
      puts auth.inspect
      if !!auth then
        redirect_to user_path(u)
      else
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end

  def add_course
    @course = Course.new
    @course.user_id = @user.id
    @course.location = "#{cookies[:lat]},#{cookies[:lon]}"
    puts cookies[:lat]
    puts cookies[:lon]
  end

  def remove_course
    @course = Course.find(params['courseid'])
    @course.destroy
    redirect_to @user, notice: 'Curso excluído!'
  end

  def new_attendance
    # TODO
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nome, :username, :cartao, :password, :password_confirmation)
    end
end
