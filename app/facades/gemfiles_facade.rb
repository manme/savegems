class GemfilesFacade
  attr_reader :gemfiles, :gemfile

  def initialize user
    @user = user
    @gemfile = user.gemfiles.build
  end

  def create params
    @gemfile = @user.gemfiles.build params
    @gemfile.save
  end

  def update params
    @gemfile = @user.gemfiles.find(params[:id])
    @gemfile.update(params)
  end

  def show hid
    @gemfile = Gemfile.find_by hashid: hid
  end

  def all
    @gemfiles = @user.gemfiles.all
  end
end
