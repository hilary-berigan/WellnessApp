class User_Date
  attr_accessor :month, :day, :year

  def initialize
    @month = DateTime.now.strftime('%m')
    @day = DateTime.now.strftime('%d')
    @year = DateTime.now.strftime('%Y')
  end
end