class MaxIntSet
  attr_reader :store, :max
  
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise Exception.new('Out of bounds') if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    raise Exception.new('Out of bounds') if num > @max || num < 0
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num
  end

  def remove(num)
    @store[num % 20] -= [num]
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # resize if needed

    self.resize! if @count >= num_buckets - 1
    
    bucket = @store[num % num_buckets]
    # check to avoid duplicates
    
    unless bucket.include?(num)
      @count += 1
      bucket << num
      return true
    end
    false
  end

  def remove(num)
    if include?(num)
      @count -= 1
      @store[num % num_buckets] -= [num]
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        new_store[num % new_store.length] << num
      end
    end
    @store = new_store
  end
end
