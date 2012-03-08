class CartesianProduct
  include Enumerable
  def initialize(first_enum, second_enum)
    @fst,@snd = first_enum, second_enum
  end

  def each
    @fst.each do |a|
      @snd.each { |b| yield [a,b]  }
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
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)