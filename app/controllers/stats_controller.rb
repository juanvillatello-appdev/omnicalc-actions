class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count
    
    a=@numbers[0]
  
      @numbers.each do |num|       
        if  num<a           
        a=num
        end
      end
    

    @minimum = a

      b=@numbers[0]
  
      @numbers.each do |num|       
       if  num>b           
        b=num
        end
      end


    @maximum = b

    @range = b-a

    # Median
    # ======

    numb=@numbers.sort
    median=0
  
    if numb.count%2==0
      lower=numb[(numb.count/2)-1]
      upper=numb[(numb.count/2)]
      median=(lower+upper)/2.to_f
    else
     median=numb[numb.count/2]
    end


    @median = median
    
     sum=0
  
      @numbers.each do |num|       
      sum=sum+num
      end

    @sum = sum

    mean=sum/@numbers.count
    
    @mean = mean

    # Variance
    # ========
    var=0
    
    @numbers.each do |nums|
    var=var+((nums-mean)**2)
    end
 
    variance=var/(@numbers.count)

    @variance = variance

    @standard_deviation = Math.sqrt(variance)

    # Mode
    # ====

    c=[]
    count=0
  
    @numbers.each do |num|  
      count_c=@numbers.count(num)
      if    count_c>=count && (!c.include? num)
        if count_c!=count 
          c=[]
        end  
        count=count_c
        c.push(num)
      end
    end

    @mode = c

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
