class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self.resize! if @count >= num_buckets - 1
    
    bucket = self[key]
    # check to avoid duplicates
    
    unless bucket.include?(key)
      @count += 1
      bucket << key
      return true
    end
    false
  end

  def include?(key)
    self[key].include?(key)
  end
  
  def remove(key)
    if self.include?(key)
      @count -= 1
      @store[key.hash % num_buckets] -= [key]
    end
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    
    @store.each do |bucket|
      bucket.each { |num| new_store[num.hash % new_store.length] << num }
    end

    @store = new_store
  end
end
