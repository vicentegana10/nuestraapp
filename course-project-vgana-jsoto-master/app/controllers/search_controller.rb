class SearchController < ApplicationController
    # before_action :set_lodging, only: %i[ show edit update destroy ]
  def index
    @user_searched = nil

    if params["commit"] == "Search by email"
        puts("a")
        @user_searched = User.find_by(id: params["get"]["user_id"])


    elsif params["search"] != nil 
        @searched = 1
        @lodgings = Lodging.all
        if params["location"] != ""
            @lodgings = @lodgings.all.where("location = ?", params["location"])
        end
        if params["fee_min"] != ""
            @lodgings = @lodgings.all.where("fee >= ?", params["fee_min"])
        end
        if params["fee_max"] != ""
            @lodgings = @lodgings.all.where("fee <= ?", params["fee_max"])
        end

        services_search_array = []
        if params["s1"] == "1"
            services_search_array.push(1)
        end
        if params["s2"] == "1"
            services_search_array.push(2)
        end
        if params["s3"] == "1"
            services_search_array.push(3)
        end
        if params["s4"] == "1"
            services_search_array.push(4)
        end
        if params["s5"] == "1"
            services_search_array.push(5)
        end
        if params["s6"] == "1"
            services_search_array.push(6)
        end
        if params["s7"] == "1"
            services_search_array.push(7)
        end
        if params["s8"] == "1"
            services_search_array.push(8)
        end
        if params["s9"] == "1"
            services_search_array.push(9)
        end
        if params["s10"] == "1"
            services_search_array.push(10)
        end
        if params["s11"] == "1"
            services_search_array.push(11)
        end
        if params["s12"] == "1"
            services_search_array.push(12)
        end
        if params["s13"] == "1"
            services_search_array.push(13)
        end
        if params["s14"] == "1"
            services_search_array.push(14)
        end
        if params["s15"] == "1"
            services_search_array.push(15)
        end
        if params["s16"] == "1"
            services_search_array.push(16)
        end
        if params["s17"] == "1"
            services_search_array.push(17)
        end
        if params["s18"] == "1"
            services_search_array.push(18)
        end

        services_search_array.each do |number|
            @lodgings_search = []
            @lodgings.each do |x|
                services_array = x.services.map{|service| service.kind}
                if services_array.include? number
                    @lodgings_search.push(x)
                end
                services_array = []
            end
        @lodgings = @lodgings_search

        end
    
    else 
        @searched = 0
    end
    
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  # PATCH/PUT
  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_lodging
  #  @lodging = Lodging.find(params[:id])
  #end

  # Only allow a list of trusted parameters through.
  
end
