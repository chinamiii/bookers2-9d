class HomesController < ApplicationController

def top
end

def about
end

def search
  @newbook = Book.new
  @books = Book.search(params[:keyword])

  @newbook.user_id = current_user.id
end

end
