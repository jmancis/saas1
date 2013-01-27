class CartesianProduct
  include Enumerable
  def initialize(enu1,enu2)
  @enu1=enu1
	@enu2=enu2
  end
  def each
     @enu1.each do |elt1|
	@enu2.each do |elt2|
       	  yield [elt1,elt2]
	end
     end
  end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty
